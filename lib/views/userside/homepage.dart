// homepage.dart
import 'package:flutter/material.dart';
import 'package:flutter_sms_inbox/flutter_sms_inbox.dart';
import 'package:permission_handler/permission_handler.dart';
import 'spam_page.dart';
import 'app_drawer.dart';
import 'dart:async';
import 'classify.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dspamph/views/userside/spam_reports_history.dart';
import 'messages_list_view.dart';
import 'calendar_navigation_bar.dart';

void main() {
  runApp(DSpamPhApp());
}

class DSpamPhApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'D-SpamPH',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static final GlobalKey<_HomePageState> homePageKey =
      GlobalKey<_HomePageState>();
  final SmsQuery _query = SmsQuery();
  final StreamController<List<SmsMessage>> _spamMessagesStreamController =
      StreamController<List<SmsMessage>>();
  final Map<String, int> spamMessageCountByDate = {};
  List<SmsMessage> _messages = [];
  late MessageClassifier _messageClassifier;
  String prediction = '';
  List<SmsMessage> spamMessages = [];
  List<SmsMessage> _cachedMessages = [];
  DateTime _selectedDate = DateTime.now();
  bool _showCalendar = false;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  List<String> uploadedSpamData = [];
  List<String> uploadedTime = [];
  List<String> uploadedSender = [];

  bool _isSpamDataUploaded(String spamContent) {
    return uploadedSpamData.contains(spamContent);
  }

  void addSpamDataToFirestore() async {
    final FirebaseAuth _auth = FirebaseAuth.instance;

    final UserCredential userCredential =
        await _auth.signInWithEmailAndPassword(
      email: "alladynica.alinsod@wvsu.edu.ph",
      password: "Anawvsu123",
    );

    if (userCredential.user != null) {
      final CollectionReference spamCollection =
          firestore.collection('spam_reports');

      int spamDataCount = ((await spamCollection.doc('spamDataCount').get())
              .data() as Map<String, dynamic>?)?['count'] as int? ??
          0;

      String nextSpamDataID = 'spamData ${spamDataCount + 1}';

      for (var message in spamMessages) {
        final spamContent = message.body ?? 'No message body';
        final spamSender = message.address ?? 'Unknown Sender';
        final timestamp = DateTime.now().toLocal();

        if (!_isSpamDataUploaded(spamContent)) {
          final spamData = {
            'spam_sender_number': message.address ?? 'Unknown Sender',
            'date_time_received': message.date?.toLocal() ?? DateTime.now(),
            'spam_content': spamContent,
          };

          print(message.address ?? 'Unknown Sender');
          print(message.date?.toLocal() ?? DateTime.now());
          print(spamContent);

          print('spamSender:');
          print(spamSender);

          print('Date and Time Reported');
          print(timestamp);

          await spamCollection.doc(nextSpamDataID).set(spamData);

          print('Spam data added to Firestore with ID: $nextSpamDataID');
          print('-----------------------------------------------------');

          spamDataCount++;
          await spamCollection
              .doc('spamDataCount')
              .set({'count': spamDataCount});

          nextSpamDataID = 'spamData ${spamDataCount + 1}';

          uploadedSpamData.add(spamContent);
          uploadedSender.add(spamSender);
          uploadedTime.add(timestamp.toString());
          _updateSharedPreferences();
        } else {
          print('Spam data already uploaded: $spamContent');
        }
      }
    }
  }

  late SharedPreferences _prefs;

  @override
  void initState() {
    super.initState();
    _messageClassifier = MessageClassifier();
    _loadModel();
    _initSharedPreferences();
    _initSmsListener();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      addSpamDataToFirestore();
    });
  }

  Future<void> _loadModel() async {
    await _messageClassifier.loadModel(_messages);
  }

  Future<String> predictMessage(String message) async {
    return _messageClassifier.predictMessage(message);
  }

  void _initSharedPreferences() async {
    _prefs = await SharedPreferences.getInstance();
    uploadedSpamData = _prefs.getStringList('uploadedSpamData') ?? [];
    uploadedTime = _prefs.getStringList('uploadedTime') ?? [];
    uploadedSender = _prefs.getStringList('uploadedSender') ?? [];
  }

  void _updateSharedPreferences() {
    _prefs.setStringList('uploadedSpamData', uploadedSpamData);
    _prefs.setStringList('uploadedTime', uploadedTime);
    _prefs.setStringList('uploadedSender', uploadedSender);
  }

  @override
  void dispose() {
    _spamMessagesStreamController.close();
    super.dispose();
  }

  Future<void> _initSmsListener() async {
    if (await Permission.sms.isDenied) {
      return;
    }

    await Permission.sms.request();
    _refreshMessages();
  }

  List<SmsMessage> _filterMessagesAll(List<SmsMessage> messages) {
    return messages.where((message) {
      return _isSpam(message.body ?? '');
    }).toList();
  }

  void _filterMessagesByDate() {
    final selectedDateKey = _selectedDate.toString().split(' ')[0];

    final filteredMessages = _cachedMessages.where((message) {
      final messageDate = message.date;
      final messageDateKey = messageDate?.toLocal().toString().split(' ')[0];
      return messageDateKey == selectedDateKey && _isSpam(message.body ?? '');
    }).toList();

    spamMessages = filteredMessages;
    _updateSpamMessageCountByDate(spamMessages);
    _spamMessagesStreamController.sink.add(spamMessages);
  }

  void _updateSpamMessageCountByDate(List<SmsMessage> messages) {
    spamMessageCountByDate.clear();

    for (var message in messages) {
      final date = message.date?.toLocal().toString().split(' ')[0];
      if (date != null) {
        spamMessageCountByDate.update(date, (value) => value + 1,
            ifAbsent: () => 1);
      }
    }
  }

  Future<void> _refreshMessages() async {
    if (!_showCalendar) {
      _cachedMessages.clear();
    }

    try {
      final messages = await _query.querySms(
        kinds: [SmsQueryKind.inbox],
      );

      if (_showCalendar) {
        if (_cachedMessages.isEmpty) {
          _cachedMessages = _filterMessagesAll(messages);
        }
        _filterMessagesByDate();
      } else {
        if (_cachedMessages.isEmpty) {
          spamMessages = _filterMessagesAll(messages
              .where((message) =>
                  message.address != null &&
                  message.address!.startsWith("+639"))
              .toList());
        } else {
          spamMessages = _cachedMessages;
        }
        _updateSpamMessageCountByDate(spamMessages);
        _spamMessagesStreamController.sink.add(spamMessages);
      }
    } catch (error) {
      print('Error refreshing messages: $error');
    }
  }

  void _handleMessageTap(SmsMessage message) async {
    String newMessage = message.body ?? "";
    if (_isSpam(newMessage)) {
      Navigator.push(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => SpamPage(
            message: message,
            spamMessageCountByDate: spamMessageCountByDate,
            uploadedSpamData: uploadedSpamData,
          ),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(1.0, 0.0);
            const end = Offset.zero;
            const curve = Curves.easeInOut;

            var tween = Tween(begin: begin, end: end).chain(
              CurveTween(curve: curve),
            );

            var offsetAnimation = animation.drive(tween);

            return SlideTransition(
              position: offsetAnimation,
              child: child,
            );
          },
        ),
      ).then((_) {
        homePageKey.currentState?._refreshMessages();
      });
    } else {
      print('Non-Spam Message: $newMessage');
    }
  }

  void _navigateToSpamReportsHistoryPage() {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            SpamReportsHistoryPage(
          uploadedSpamData: uploadedSpamData,
          uploadedTime: uploadedTime,
          uploadedSender: uploadedSender,
        ),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(1.0, 0.0);
          const end = Offset.zero;
          const curve = Curves.easeInOut;

          var tween = Tween(begin: begin, end: end).chain(
            CurveTween(curve: curve),
          );

          var offsetAnimation = animation.drive(tween);

          return SlideTransition(
            position: offsetAnimation,
            child: child,
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      key: homePageKey,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('SMS Spam History'),
          actions: [
            IconButton(
              icon: Icon(Icons.refresh),
              onPressed: _refreshMessages,
            ),
            IconButton(
              icon: Icon(Icons.history),
              onPressed: _navigateToSpamReportsHistoryPage,
            ),
          ],
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.message), text: 'Spam Messages'),
              Tab(icon: Icon(Icons.calendar_today), text: 'Calendar'),
            ],
            onTap: (index) {
              setState(() {
                _showCalendar = index == 1;
              });
            },
          ),
        ),
        body: TabBarView(
          children: [
            _buildSpamMessagesView(),
            CalendarNavigationBar(
              selectedDate: _selectedDate,
              onDateSelected: (selectedDay) {
                setState(() {
                  _selectedDate = selectedDay;
                });
              },
              spamMessageCountByDate: spamMessageCountByDate,
              spamMessages: spamMessages,
            ),
          ],
        ),
        drawer: AppDrawer(
          context,
          spamMessageCountByDate: spamMessageCountByDate,
          uploadedSpamData: uploadedSpamData,
          uploadedTime: uploadedTime,
          uploadedSender: uploadedSender,
        ),
      ),
    );
  }

  Widget _buildSpamMessagesView() {
    return Container(
      padding: const EdgeInsets.all(10.0),
      child: StreamBuilder<List<SmsMessage>>(
        stream: _spamMessagesStreamController.stream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final spamMessages = snapshot.data as List<SmsMessage>;
            return spamMessages.isNotEmpty
                ? MessagesListView(
                    messages: spamMessages,
                    onMessageTap: _handleMessageTap,
                    spamMessages: [],
                  )
                : Center(
                    child: Text(
                      'No spam messages to show.',
                      style: Theme.of(context).textTheme.headline6,
                      textAlign: TextAlign.center,
                    ),
                  );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  bool _isSpam(String message) {
    final spamKeywords = [
      "free",
      "register",
      "claim",
      "sign",
      "join",
      "jackpotcity",
      "sbet",
      "deposit",
      "bonus",
      "free money",
      "prize",
      "winning",
      "chance",
      "win",
      "https",
    ];

    for (var keyword in spamKeywords) {
      if (message.toLowerCase().contains(keyword)) {
        return true;
      }
    }
    return false;
  }

  bool _isSameDate(DateTime? date1, DateTime date2) {
    return date1 != null &&
        date1.year == date2.year &&
        date1.month == date2.month &&
        date1.day == date2.day;
  }
}
