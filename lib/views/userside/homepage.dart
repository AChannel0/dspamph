// import 'package:flutter/material.dart';
// import 'app_drawer.dart';
// import 'report_spams.dart';
// import 'spam_page.dart';

// class HomePage extends StatefulWidget {
//   const HomePage({super.key});

//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

//   @override
//   void initState() {
//     super.initState();
//     // initialization - for function phase
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       key: _scaffoldKey,
//       appBar: AppBar(
//         backgroundColor: Colors.grey,
//         leading: Builder(
//           builder: (BuildContext context) {
//             return IconButton(
//               icon: const Icon(Icons.menu, color: Colors.white),
//               onPressed: () {
//                 _scaffoldKey.currentState!.openDrawer();
//               },
//             );
//           },
//         ),
//         title: const Text(
//           'SMS SPAMS HISTORY',
//           style: TextStyle(color: Colors.white),
//         ),
//       ),
//       drawer: Builder(
//         builder: (BuildContext context) {
//           return AppDrawer(context);
//         },
//       ),
//       body: ListView.builder(
//         itemCount: 20, // Replace with your actual number of SMS messages
//         itemBuilder: (context, index) {
//           // Call the readMessages() function
//           return ListTile(
//             leading: const CircleAvatar(
//               child: Icon(Icons.message),
//             ),
//             title: const Text('Phone Number'),
//             subtitle: const Text('Message Overview'),
//             onTap: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => const SpamPage(),
//                 ),
//               );
//             },
//           );
//         },
//       ),
//       bottomNavigationBar: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: ElevatedButton.icon(
//           onPressed: () {
//             Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (context) => const ReportSpams(totalSpamMessages: 20),
//               ),
//             );
//           },
//           icon: const Icon(Icons.report),
//           label: const Text('REPORT SPAMS'),
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// // import 'package:custom_sms_plugin/custom_sms_plugin.dart';
// // import 'package:';
// import 'package:custom_sms_plugin/custom_sms_plugin.dart';

// class HomePage extends StatefulWidget {
//   const HomePage({Key? key}) : super(key: key);

//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   List<Map<String, dynamic>> _messages = [];

//   @override
//   void initState() {
//     super.initState();
//     _fetchMessages();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('SMS SPAMS HISTORY'),
//       ),
//       body: ListView.builder(
//         itemCount: _messages.length,
//         itemBuilder: (context, index) {
//           var message = _messages[index];

//           return ListTile(
//             leading: const CircleAvatar(
//               child: Icon(Icons.message),
//             ),
//             title: Text(message['sender']),
//             subtitle: Text(message['body']),
//           );
//         },
//       ),
//       bottomNavigationBar: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: ElevatedButton.icon(
//           onPressed: () {
//             _fetchMessages();
//           },
//           icon: const Icon(Icons.refresh),
//           label: const Text('REFRESH'),
//         ),
//       ),
//     );
//   }

//   Future<void> _fetchMessages() async {
//     try {
//       final List<Map<String, dynamic>> messages =
//           await CustomSmsPlugin.fetchSmsMessages();

//       setState(() {
//         _messages = messages;
//       });
//     } catch (e) {
//       // Handle error
//     }
//   }
// }

// import 'dart:async';
// import 'package:flutter/material.dart';
// // import 'package:flutter_sms_inbox/flutter_sms_inbox.dart';
// import 'package:sms_advanced/sms_advanced.dart';

// class HomePage extends StatefulWidget {
//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   List<SmsMessage> _messages = [];

//   @override
//   void initState() {
//     super.initState();
//     fetchSMSMessages();
//   }

//   Future<void> fetchSMSMessages() async {
//   List<SmsMessage> messages = await SmsQueryAdvanced.getAllSms;
//   setState(() {
//     _messages = messages;
//   });

//   List<SmsThread> threads = await SmsQueryAdvanced.getAllThreads;
//   for (int index = 0; index < threads.length; index++) {
//     SmsMessage? firstMessage = threads[index].messages.first;
//     if (firstMessage != null) {
//       String senderNumber = firstMessage.address;
//       String sim = firstMessage.simSlot.toString();
//       String message = firstMessage.body;
//       print('sender number: $senderNumber');
//       print('receiver sim: $sim');
//       print('message: $message');
//     }
//   }
// }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('SMS Inbox'),
//       ),
//       body: ListView.builder(
//         itemCount: _messages.length,
//         itemBuilder: (context, index) {
//           SmsMessage message = _messages[index];
//           bool isSpam = isMessageSpam(message);
//           return ListTile(
//             title: Text(isSpam ? 'Spam Message' : 'Normal Message'),
//             subtitle: Text(message.body),
//             onTap: () {
//               if (isSpam) {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => SpamPage(message: message),
//                   ),
//                 );
//               } else {
//                 // Handle normal message tap
//               }
//             },
//           );
//         },
//       ),
//     );
//   }

//   bool isMessageSpam(SmsMessage message) {
//     // TODO: Implement spam detection using your AI model
//     // Return true if the message is detected as spam, false otherwise
//     return false;
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:sms_advanced/sms_advanced.dart';

// class HomePage extends StatefulWidget {
//   const HomePage({Key? key}) : super(key: key);

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   final SmsQuery query = SmsQuery();
//   List<SmsThread> threads = [];

//   @override
//   void initState() {
//     super.initState();
//     query.getAllThreads.then((value) {
//       threads = value;
//       setState(() {});
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         theme: ThemeData(
//           primarySwatch: Colors.blue,
//         ),
//         home: Scaffold(
//           appBar: AppBar(
//             title: const Text("Example"),
//           ),
//           body: ListView.builder(
//             itemCount: threads.length,
//             itemBuilder: (BuildContext context, int index) {
//               return Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   ListTile(
//                     minVerticalPadding: 8,
//                     minLeadingWidth: 4,
//                     title: Text(threads[index].messages.last.body ?? 'empty'),
//                     subtitle: Text(threads[index].contact?.address ?? 'empty'),
//                   ),
//                   const Divider()
//                 ],
//               );
//             },
//           ),
//         ));
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:flutter_sms_inbox/flutter_sms_inbox.dart';
// import 'package:permission_handler/permission_handler.dart';

// class HomePage extends StatefulWidget {
//   const HomePage({Key? key}) : super(key: key);

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   final SmsQuery _query = SmsQuery();
//   List<SmsMessage> _messages = [];

//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter SMS Inbox App',
//       theme: ThemeData(
//         primarySwatch: Colors.teal,
//       ),
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('SMS Inbox Example'),
//         ),
//         body: Container(
//           padding: const EdgeInsets.all(10.0),
//           child: _messages.isNotEmpty
//               ? _MessagesListView(
//                   messages: _messages,
//                 )
//               : Center(
//                   child: Text(
//                     'No messages to show.\n Tap refresh button...',
//                     style: Theme.of(context).textTheme.headlineSmall,
//                     textAlign: TextAlign.center,
//                   ),
//                 ),
//         ),
//         floatingActionButton: FloatingActionButton(
//           onPressed: () async {
//             var permission = await Permission.sms.status;
//             if (permission.isGranted) {
//               final messages = await _query.querySms(
//                 kinds: [
//                   SmsQueryKind.inbox,
//                   // SmsQueryKind.sent,
//                 ],
//                 // address: '+254712345789',
//                 count: -1,
//               );
//               debugPrint('sms inbox messages: ${messages.length}');

//               setState(() => _messages = messages);
//             } else {
//               await Permission.sms.request();
//             }
//           },
//           child: const Icon(Icons.refresh),
//         ),
//       ),
//     );
//   }
// }

// class _MessagesListView extends StatelessWidget {
//   const _MessagesListView({
//     Key? key,
//     required this.messages,
//   }) : super(key: key);

//   final List<SmsMessage> messages;

//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       shrinkWrap: true,
//       itemCount: messages.length,
//       itemBuilder: (BuildContext context, int i) {
//         var message = messages[i];

//         return ListTile(
//           title: Text('${message.sender} [${message.date}]'),
//           subtitle: Text('${message.body}'),
//         );
//       },
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:flutter_sms_inbox/flutter_sms_inbox.dart';
// import 'package:permission_handler/permission_handler.dart';

// class HomePage extends StatefulWidget {
//   const HomePage({Key? key}) : super(key: key);

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   final SmsQuery _query = SmsQuery();
//   List<SmsMessage> _messages = [];

//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter SMS Inbox App',
//       theme: ThemeData(
//         primarySwatch: Colors.teal,
//       ),
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('SMS Inbox Example'),
//         ),
//         body: Container(
//           padding: const EdgeInsets.all(10.0),
//           child: _messages.isNotEmpty
//               ? _MessagesListView(
//                   messages: _messages,
//                 )
//               : Center(
//                   child: Text(
//                     'No messages to show.\nTap refresh button...',
//                     style: Theme.of(context).textTheme.headline6,
//                     textAlign: TextAlign.center,
//                   ),
//                 ),
//         ),
//         floatingActionButton: FloatingActionButton(
//           onPressed: () async {
//             var permission = await Permission.sms.status;
//             if (permission.isGranted) {
//               final messages = await _query.querySms(
//                 kinds: [
//                   SmsQueryKind.inbox,
//                 ],
//                 count: -1,
//               );
//               debugPrint('sms inbox messages: ${messages.length}');

//               setState(() {
//                 _messages = messages;
//               });
//             } else {
//               await Permission.sms.request();
//             }
//           },
//           child: const Icon(Icons.refresh),
//         ),
//       ),
//     );
//   }
// }

// class _MessagesListView extends StatelessWidget {
//   const _MessagesListView({
//     Key? key,
//     required this.messages,
//   }) : super(key: key);

//   final List<SmsMessage> messages;

//   @override
//   Widget build(BuildContext context) {
//     Map<String, List<SmsMessage>> groupedMessages = {};
//     for (var message in messages) {
//       String sender = message.sender!;
//       if (groupedMessages.containsKey(sender)) {
//         groupedMessages[sender]!.add(message);
//       } else {
//         groupedMessages[sender] = [message];
//       }
//     }

//     return ListView.builder(
//       shrinkWrap: true,
//       itemCount: groupedMessages.length,
//       itemBuilder: (BuildContext context, int i) {
//         String contactNumber = groupedMessages.keys.elementAt(i);
//         List<SmsMessage> contactMessages = groupedMessages[contactNumber]!;

//         SmsMessage latestMessage = contactMessages.first;

//         return ListTile(
//           title: Text('$contactNumber [${latestMessage.date}]'),
//           subtitle: Text('${latestMessage.body}'),
//         );
//       },
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:flutter_sms_inbox/flutter_sms_inbox.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'spam_page.dart';
// import 'app_drawer.dart';

// class HomePage extends StatefulWidget {
//   const HomePage({Key? key}) : super(key: key);

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   final SmsQuery _query = SmsQuery();
//   List<SmsMessage> _messages = [];

//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter SMS Inbox App',
//       theme: ThemeData(
//         primarySwatch: Colors.orange,
//       ),
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('SMS Spam History'),
//         ),
//         drawer: AppDrawer(context),
//         body: Container(
//           padding: const EdgeInsets.all(10.0),
//           child: _messages.isNotEmpty
//               ? _MessagesListView(
//                   messages: _messages,
//                   onTap: (message) {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => SpamPage(
//                           message: message,
//                           threadMessages: const [],
//                         ),
//                       ),
//                     );
//                   },
//                 )
//               : Center(
//                   child: Text(
//                     'No messages to show.\nTap refresh button...',
//                     style: Theme.of(context).textTheme.titleLarge,
//                     textAlign: TextAlign.center,
//                   ),
//                 ),
//         ),
//         floatingActionButton: FloatingActionButton(
//           onPressed: () async {
//             var permission = await Permission.sms.status;
//             if (permission.isGranted) {
//               final messages = await _query.querySms(
//                 kinds: [
//                   SmsQueryKind.inbox,
//                 ],
//                 count: -1,
//               );
//               debugPrint('sms inbox messages: ${messages.length}');

//               setState(() {
//                 _messages = messages;
//               });
//             } else {
//               await Permission.sms.request();
//             }
//           },
//           child: const Icon(Icons.refresh),
//         ),
//       ),
//     );
//   }
// }

// class _MessagesListView extends StatelessWidget {
//   const _MessagesListView({
//     Key? key,
//     required this.messages,
//     required this.onTap,
//   }) : super(key: key);

//   final List<SmsMessage> messages;
//   final Function(SmsMessage) onTap;

//   @override
//   Widget build(BuildContext context) {
//     Map<String, List<SmsMessage>> groupedMessages = {};
//     for (var message in messages) {
//       String sender = message.sender!;
//       if (groupedMessages.containsKey(sender)) {
//         groupedMessages[sender]!.add(message);
//       } else {
//         groupedMessages[sender] = [message];
//       }
//     }

//     return ListView.builder(
//       shrinkWrap: true,
//       itemCount: groupedMessages.length,
//       itemBuilder: (BuildContext context, int i) {
//         String contactNumber = groupedMessages.keys.elementAt(i);
//         List<SmsMessage> contactMessages = groupedMessages[contactNumber]!;

//         SmsMessage latestMessage = contactMessages.first;

//         String messageBody = latestMessage.body ?? '';

//         return ListTile(
//           title: Text(contactNumber),
//           subtitle: Text(
//             messageBody.split('\n').first,
//             maxLines: 1,
//             overflow: TextOverflow.ellipsis,
//           ),
//           onTap: () => onTap(latestMessage),
//         );
//       },
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:flutter_sms_inbox/flutter_sms_inbox.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'spam_page.dart';
// import 'app_drawer.dart';

// class HomePage extends StatefulWidget {
//   const HomePage({Key? key}) : super(key: key);

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   final SmsQuery _query = SmsQuery();
//   List<SmsMessage> _messages = [];

//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter SMS Inbox App',
//       theme: ThemeData(
//         primarySwatch: Colors.orange,
//       ),
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('SMS Spam History'),
//         ),
//         drawer: AppDrawer(context),
//         body: Container(
//           padding: const EdgeInsets.all(10.0),
//           child: _messages.isNotEmpty
//               ? _MessagesListView(
//                   messages: _messages,
//                   onTap: (message) {
//                     _fetchThreadMessages(message).then((threadMessages) {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => SpamPage(
//                             message: message,
//                             threadMessages: threadMessages,
//                           ),
//                         ),
//                       );
//                     });
//                   },
//                 )
//               : Center(
//                   child: Text(
//                     'No messages to show.\nTap refresh button...',
//                     style: Theme.of(context).textTheme.titleLarge,
//                     textAlign: TextAlign.center,
//                   ),
//                 ),
//         ),
//         floatingActionButton: FloatingActionButton(
//           onPressed: () async {
//             var permission = await Permission.sms.status;
//             if (permission.isGranted) {
//               final messages = await _query.querySms(
//                 kinds: [
//                   SmsQueryKind.inbox,
//                 ],
//                 count: -1,
//               );
//               debugPrint('sms inbox messages: ${messages.length}');

//               setState(() {
//                 _messages = messages;
//               });
//             } else {
//               await Permission.sms.request();
//             }
//           },
//           child: const Icon(Icons.refresh),
//         ),
//       ),
//     );
//   }

//   Future<List<SmsMessage>> _fetchThreadMessages(SmsMessage message) async {
//     if (message.threadId != null) {
//       List<SmsMessage> threadMessages = await _query.querySms(
//         threadId: message.threadId,
//         kinds: [SmsQueryKind.inbox],
//       );
//       return threadMessages;
//     }
//     return [];
//   }
// }

// class _MessagesListView extends StatelessWidget {
//   const _MessagesListView({
//     Key? key,
//     required this.messages,
//     required this.onTap,
//   }) : super(key: key);

//   final List<SmsMessage> messages;
//   final Function(SmsMessage) onTap;

//   @override
//   Widget build(BuildContext context) {
//     Map<String, List<SmsMessage>> groupedMessages = {};
//     for (var message in messages) {
//       String sender = message.sender!;
//       if (groupedMessages.containsKey(sender)) {
//         groupedMessages[sender]!.add(message);
//       } else {
//         groupedMessages[sender] = [message];
//       }
//     }

//     return ListView.builder(
//       shrinkWrap: true,
//       itemCount: groupedMessages.length,
//       itemBuilder: (BuildContext context, int i) {
//         String contactNumber = groupedMessages.keys.elementAt(i);
//         List<SmsMessage> contactMessages = groupedMessages[contactNumber]!;

//         SmsMessage latestMessage = contactMessages.first;

//         String messageBody = latestMessage.body ?? '';

//         return ListTile(
//           title: Text(contactNumber),
//           subtitle: Text(
//             messageBody.split('\n').first,
//             maxLines: 1,
//             overflow: TextOverflow.ellipsis,
//           ),
//           onTap: () => onTap(latestMessage),
//         );
//       },
//     );
//   }
// }

//
//
//
// import 'package:flutter/material.dart';
// import 'package:flutter_sms_inbox/flutter_sms_inbox.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'spam_detection.dart';
// import 'spam_page.dart';
// import 'app_drawer.dart';

// class HomePage extends StatefulWidget {
//   const HomePage({Key? key}) : super(key: key);

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   final SmsQuery _query = SmsQuery();
//   List<SmsMessage> _messages = [];
//   SpamDetection spamDetection = SpamDetection();
//   String prediction = '';

//   @override
//   void initState() {
//     super.initState();
//     spamDetection.loadModel();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'D-SpamPH',
//       theme: ThemeData(
//         primarySwatch: Colors.orange,
//       ),
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('SMS Spam History'),
//         ),
//         drawer: AppDrawer(context),
//         body: Container(
//           padding: const EdgeInsets.all(10.0),
//           child: _messages.isNotEmpty
//               ? _MessagesListView(
//                   messages: _messages,
//                   onTap: (message) {
//                     _fetchThreadMessages(message).then((threadMessages) {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => SpamPage(
//                             message: message,
//                             threadMessages: threadMessages,
//                           ),
//                         ),
//                       );
//                     });
//                   },
//                 )
//               : Center(
//                   child: Text(
//                     'No messages to show.\nTap refresh button...',
//                     style: Theme.of(context).textTheme.headline6,
//                     textAlign: TextAlign.center,
//                   ),
//                 ),
//         ),
//         floatingActionButton: FloatingActionButton(
//           onPressed: () async {
//             var permission = await Permission.sms.status;
//             if (permission.isGranted) {
//               final messages = await _query.querySms(
//                 kinds: [
//                   SmsQueryKind.inbox,
//                 ],
//                 count: -1,
//               );
//               debugPrint('sms inbox messages: ${messages.length}');

//               List<SmsMessage> spamMessages = [];

//               for (var message in messages) {
//                 String prediction =
//                     await spamDetection.predictMessage(message.body ?? '');
//                 if (prediction == 'Spam') {
//                   spamMessages.add(message);
//                 }
//               }

//               setState(() {
//                 _messages = spamMessages;
//               });
//             } else {
//               await Permission.sms.request();
//             }
//           },
//           child: const Icon(Icons.refresh),
//         ),
//       ),
//     );
//   }

//   Future<List<SmsMessage>> _fetchThreadMessages(SmsMessage message) async {
//     if (message.threadId != null) {
//       List<SmsMessage> threadMessages = await _query.querySms(
//         threadId: message.threadId,
//         kinds: [SmsQueryKind.inbox],
//       );
//       return threadMessages;
//     }
//     return [];
//   }
// }

// class _MessagesListView extends StatelessWidget {
//   const _MessagesListView({
//     Key? key,
//     required this.messages,
//     required this.onTap,
//   }) : super(key: key);

//   final List<SmsMessage> messages;
//   final Function(SmsMessage) onTap;

//   @override
//   Widget build(BuildContext context) {
//     Map<String, List<SmsMessage>> groupedMessages = {};
//     for (var message in messages) {
//       String sender = message.sender!;
//       if (groupedMessages.containsKey(sender)) {
//         groupedMessages[sender]!.add(message);
//       } else {
//         groupedMessages[sender] = [message];
//       }
//     }

//     return ListView.builder(
//       shrinkWrap: true,
//       itemCount: groupedMessages.length,
//       itemBuilder: (BuildContext context, int i) {
//         String contactNumber = groupedMessages.keys.elementAt(i);
//         List<SmsMessage> contactMessages = groupedMessages[contactNumber]!;

//         SmsMessage latestMessage = contactMessages.first;

//         String messageBody = latestMessage.body ?? '';

//         return ListTile(
//           title: Text(contactNumber),
//           subtitle: Text(
//             messageBody.split('\n').first,
//             maxLines: 1,
//             overflow: TextOverflow.ellipsis,
//           ),
//           onTap: () => onTap(latestMessage),
//         );
//       },
//     );
//   }
// }

/////////////////////////////
///
// import 'package:flutter/material.dart';
// import 'package:flutter_sms_inbox/flutter_sms_inbox.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'spam_detection.dart'; // Import spam_detection.dart
// import 'spam_page.dart';
// import 'app_drawer.dart';

// class HomePage extends StatefulWidget {
//   const HomePage({Key? key}) : super(key: key);

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   final SmsQuery _query = SmsQuery();
//   List<SmsMessage> _messages = [];
//   SpamDetection spamDetection = SpamDetection();
//   String prediction = '';

//   @override
//   void initState() {
//     super.initState();
//     spamDetection.loadModel();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'D-SpamPH',
//       theme: ThemeData(
//         primarySwatch: Colors.orange,
//       ),
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('SMS Spam History'),
//         ),
//         drawer: AppDrawer(context),
//         body: Container(
//           padding: const EdgeInsets.all(10.0),
//           child: _messages.isNotEmpty
//               ? _MessagesListView(
//                   messages: _messages,
//                   onTap: (message) {
//                     _fetchThreadMessages(message).then((threadMessages) {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => SpamPage(
//                             message: message,
//                             threadMessages: threadMessages,
//                           ),
//                         ),
//                       );
//                     });
//                   },
//                 )
//               : Center(
//                   child: Text(
//                     'No messages to show.\nTap refresh button...',
//                     style: Theme.of(context).textTheme.headline6,
//                     textAlign: TextAlign.center,
//                   ),
//                 ),
//         ),
//         floatingActionButton: FloatingActionButton(
//           onPressed: () async {
//             var permission = await Permission.sms.status;
//             if (permission.isGranted) {
//               final messages = await _query.querySms(
//                 kinds: [
//                   SmsQueryKind.inbox,
//                 ],
//                 count: -1,
//               );
//               debugPrint('sms inbox messages: ${messages.length}');

//               List<SmsMessage> spamMessages =
//                   await spamDetection.detectSpamMessages(messages);

//               setState(() {
//                 _messages = spamMessages;
//               });
//             } else {
//               await Permission.sms.request();
//             }
//           },
//           child: const Icon(Icons.refresh),
//         ),
//       ),
//     );
//   }

//   Future<List<SmsMessage>> _fetchThreadMessages(SmsMessage message) async {
//     if (message.threadId != null) {
//       List<SmsMessage> threadMessages = await _query.querySms(
//         threadId: message.threadId,
//         kinds: [SmsQueryKind.inbox],
//       );
//       return threadMessages;
//     }
//     return [];
//   }
// }

// class _MessagesListView extends StatelessWidget {
//   const _MessagesListView({
//     Key? key,
//     required this.messages,
//     required this.onTap,
//   }) : super(key: key);

//   final List<SmsMessage> messages;
//   final Function(SmsMessage) onTap;

//   @override
//   Widget build(BuildContext context) {
//     Map<String, List<SmsMessage>> groupedMessages = {};
//     for (var message in messages) {
//       String sender = message.sender!;
//       if (groupedMessages.containsKey(sender)) {
//         groupedMessages[sender]!.add(message);
//       } else {
//         groupedMessages[sender] = [message];
//       }
//     }

//     return ListView.builder(
//       shrinkWrap: true,
//       itemCount: groupedMessages.length,
//       itemBuilder: (BuildContext context, int i) {
//         String contactNumber = groupedMessages.keys.elementAt(i);
//         List<SmsMessage> contactMessages = groupedMessages[contactNumber]!;

//         SmsMessage latestMessage = contactMessages.first;

//         String messageBody = latestMessage.body ?? '';

//         return ListTile(
//           title: Text(contactNumber),
//           subtitle: Text(
//             messageBody.split('\n').first,
//             maxLines: 1,
//             overflow: TextOverflow.ellipsis,
//           ),
//           onTap: () => onTap(latestMessage),
//         );
//       },
//     );
//   }
// }

/////////////////////////////////////////////////////////////////////////////////

// import 'package:flutter/material.dart';
// import 'package:flutter_sms_inbox/flutter_sms_inbox.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'package:tflite_flutter/tflite_flutter.dart';
// import 'package:flutter/services.dart';
// import 'spam_page.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'D-SpamPH',
//       theme: ThemeData(
//         primarySwatch: Colors.orange,
//       ),
//       home: HomePage(),
//     );
//   }
// }

// class HomePage extends StatefulWidget {
//   const HomePage({Key? key}) : super(key: key);

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   final SmsQuery _query = SmsQuery();
//   List<SmsMessage> _messages = [];
//   late Interpreter _interpreter;
//   String prediction = '';

//   @override
//   void initState() {
//     super.initState();
//     loadModel();
//   }

//   Future<void> loadModel() async {
//     try {
//       final interpreterOptions = InterpreterOptions();
//       _interpreter = await Interpreter.fromAsset('assets/lstm_model.tflite',
//           options: interpreterOptions);
//     } catch (e) {
//       print('Failed to load the TFLite model: $e');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('SMS Spam History'),
//       ),
//       body: Container(
//         padding: const EdgeInsets.all(10.0),
//         child: _messages.isNotEmpty
//             ? _MessagesListView(
//                 messages: _messages,
//                 onTap: (message) {
//                   _fetchThreadMessages(message).then((threadMessages) {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => SpamPage(
//                           message: message,
//                           threadMessages: threadMessages,
//                         ),
//                       ),
//                     );
//                   });
//                 },
//               )
//             : Center(
//                 child: Text(
//                   'No spam messages to show.',
//                   style: Theme.of(context).textTheme.headline6,
//                   textAlign: TextAlign.center,
//                 ),
//               ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () async {
//           var permission = await Permission.sms.status;
//           if (permission.isGranted) {
//             final messages = await _query.querySms(
//               kinds: [
//                 SmsQueryKind.inbox,
//               ],
//               count: -1,
//             );
//             debugPrint('sms inbox messages: ${messages.length}');

//             List<SmsMessage> spamMessages = await detectSpamMessages(messages);

//             setState(() {
//               _messages = spamMessages;
//             });
//           } else {
//             await Permission.sms.request();
//           }
//         },
//         child: const Icon(Icons.refresh),
//       ),
//     );
//   }

//   Future<List<SmsMessage>> _fetchThreadMessages(SmsMessage message) async {
//     if (message.threadId != null) {
//       List<SmsMessage> threadMessages = await _query.querySms(
//         threadId: message.threadId,
//         kinds: [SmsQueryKind.inbox],
//       );
//       return threadMessages;
//     }
//     return [];
//   }

//   Future<List<SmsMessage>> detectSpamMessages(List<SmsMessage> messages) async {
//     List<SmsMessage> spamMessages = [];

//     for (var message in messages) {
//       String prediction = await predictMessage(message.body ?? '');
//       if (prediction == 'Spam') {
//         spamMessages.add(message);
//       }
//     }

//     return spamMessages;
//   }

//   Future<String> predictMessage(String message) async {
//     if (!_isModelLoaded()) {
//       throw Exception('TFLite model is not loaded.');
//     }

//     try {
//       final input = preprocessMessage(message);
//       final output = List<double>.filled(2, 0.0); // Output shape (None, 2)
//       final inputList = [input]; // Input shape (None, 80)
//       final outputList = [output];

//       final convertedInputList = inputList
//           .map((list) => list.map((value) => value.toDouble()).toList())
//           .toList();

//       final inputBuffer = convertedInputList.expand((x) => x).toList();
//       final outputBuffer = outputList.expand((x) => x).toList();

//       _interpreter.run(inputBuffer, outputBuffer);

//       final prediction = outputBuffer[0] > outputBuffer[1] ? 'Ham' : 'Spam';
//       return prediction;
//     } on PlatformException catch (e) {
//       print('Failed to make a prediction: $e');
//     }
//     return 'Unknown';
//   }

//   bool _isModelLoaded() {
//     return _interpreter != null;
//   }

//   Uint8List preprocessMessage(String message) {
//     final cleanedMessage = cleanMessage(message);
//     final encodedMessage = encodeMessage(cleanedMessage);
//     final paddedMessage = padSequence(encodedMessage,
//         maxlen: 80); // Maximum sequence length of 80
//     return paddedMessage;
//   }

//   String cleanMessage(String message) {
//     final cleanedText = message.replaceAll(RegExp('[^A-Za-z]'), ' ');
//     return cleanedText.toLowerCase();
//   }

//   List<int> encodeMessage(String message) {
//     final encodedMessage = message.codeUnits;
//     return encodedMessage;
//   }

//   Uint8List padSequence(List<int> sequence, {int maxlen = 80}) {
//     final paddedSequence = List<int>.filled(maxlen, 0);
//     final sequenceLength = sequence.length;
//     final truncatedSequence =
//         sequenceLength <= maxlen ? sequence : sequence.sublist(0, maxlen);
//     paddedSequence.setRange(0, truncatedSequence.length, truncatedSequence);
//     return Uint8List.fromList(paddedSequence);
//   }
// }

// class _MessagesListView extends StatelessWidget {
//   const _MessagesListView({
//     Key? key,
//     required this.messages,
//     required this.onTap,
//   }) : super(key: key);

//   final List<SmsMessage> messages;
//   final Function(SmsMessage) onTap;

//   @override
//   Widget build(BuildContext context) {
//     Map<String, List<SmsMessage>> groupedMessages = {};
//     for (var message in messages) {
//       String sender = message.sender!;
//       if (groupedMessages.containsKey(sender)) {
//         groupedMessages[sender]!.add(message);
//       } else {
//         groupedMessages[sender] = [message];
//       }
//     }

//     return ListView.builder(
//       shrinkWrap: true,
//       itemCount: groupedMessages.length,
//       itemBuilder: (BuildContext context, int i) {
//         String contactNumber = groupedMessages.keys.elementAt(i);
//         List<SmsMessage> contactMessages = groupedMessages[contactNumber]!;

//         SmsMessage latestMessage = contactMessages.first;

//         String messageBody = latestMessage.body ?? '';

//         return ListTile(
//           title: Text(contactNumber),
//           subtitle: Text(
//             messageBody.split('\n').first,
//             maxLines: 1,
//             overflow: TextOverflow.ellipsis,
//           ),
//           onTap: () => onTap(latestMessage),
//         );
//       },
//     );
//   }
// }

/////////////////////////////////////////////////////////////////
/// FROM SIR LOUIE
// import 'package:flutter/material.dart';
// import 'package:flutter_sms_inbox/flutter_sms_inbox.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'package:tflite_flutter/tflite_flutter.dart'; // Add TFLite import
// import 'spam_page.dart';
// import 'dart:typed_data';

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'D-SpamPH',
//       theme: ThemeData(
//         primarySwatch: Colors.orange,
//       ),
//       home: HomePage(),
//     );
//   }
// }

// class HomePage extends StatefulWidget {
//   const HomePage({Key? key}) : super(key: key);

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   final SmsQuery _query = SmsQuery();
//   List<SmsMessage> _messages = [];
//   late Interpreter _interpreter; // Define the interpreter
//   String prediction = '';

//   @override
//   void initState() {
//     super.initState();
//     loadModel();
//   }

//   Future<void> _handleMessageTap(SmsMessage message) async {
//     Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (context) => SpamPage(message: message),
//       ),
//     );
//   }

//   Future<void> loadModel() async {
//     try {
//       final interpreterOptions = InterpreterOptions();
//       _interpreter = await Interpreter.fromAsset(
//         'assets/lstm_gpt_10.04.23.tflite',
//         options: interpreterOptions,
//       );
//     } catch (e) {
//       print('Failed to load the TFLite model: $e');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('SMS Spam History'),
//       ),
//       body: Container(
//         padding: const EdgeInsets.all(10.0),
//         child: _messages.isNotEmpty
//             ? _MessagesListView(
//                 messages: _messages,
//                 onMessageTap: (_handleMessageTap) {
//                   _fetchThreadMessages(_handleMessageTap)
//                       .then((threadMessages) {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => SpamPage(
//                           message: _handleMessageTap,
//                           // threadMessages: threadMessages,
//                         ),
//                       ),
//                     );
//                   });
//                   String newMessage = _handleMessageTap.body ?? "";
//                   print(_handleMessageTap.body);
//                   print(predictMessage(newMessage));
//                 },
//               )
//             : Center(
//                 child: Text(
//                   'No spam messages to show.',
//                   style: Theme.of(context).textTheme.headline6,
//                   textAlign: TextAlign.center,
//                 ),
//               ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () async {
//           var permission = await Permission.sms.status;
//           if (permission.isGranted) {
//             final messages = await _query.querySms(
//               kinds: [SmsQueryKind.inbox],
//             );
//             setState(() {
//               _messages = messages;
//               // print(_query.querySms);
//             });
//           } else {
//             await Permission.sms.request();
//           }
//         },
//         child: const Icon(Icons.refresh),
//       ),
//     );
//   }

//   Future<List<SmsMessage>> _fetchThreadMessages(SmsMessage message) async {
//     if (message.threadId != null) {
//       List<SmsMessage> threadMessages = await _query.querySms(
//         threadId: message.threadId,
//         kinds: [SmsQueryKind.inbox],
//       );
//       // print(threadMessages);
//       return threadMessages;
//     }
//     return [];
//   }

//   Future<List<SmsMessage>> detectSpamMessages(List<SmsMessage> messages) async {
//     List<SmsMessage> spamMessages = [];

//     for (var message in messages) {
//       String prediction = await predictMessage(message.body ?? '');
//       if (prediction == 'Spam') {
//         spamMessages.add(message);
//       }
//     }

//     return spamMessages;
//   }

//   Future<String> predictMessage(String message) async {
//     if (!_isModelLoaded()) {
//       throw Exception('TFLite model is not loaded.');
//     }

//     try {
//       final input = preprocessMessage(message);
//       final output = List<double>.filled(2, 0.0); // Output shape (None, 2)
//       final inputList = [input]; // Input shape (None, 80)
//       final outputList = [output];

//       final convertedInputList = inputList
//           .map((list) => list.map((value) => value.toDouble()).toList())
//           .toList();

//       final inputBuffer = convertedInputList.expand((x) => x).toList();
//       final outputBuffer = outputList.expand((x) => x).toList();

//       _interpreter.run(inputBuffer, outputBuffer);

//       final prediction = outputBuffer[0] > outputBuffer[1] ? 'Ham' : 'Spam';
//       return prediction;
//     } catch (e) {
//       print('Failed to make a prediction: $e');
//     }
//     return 'Unknown';
//   }

//   bool _isModelLoaded() {
//     return _interpreter != null;
//   }

//   String cleanMessage(String message) {
//     final cleanedText = message.replaceAll(RegExp('[^A-Za-z]'), ' ');
//     return cleanedText.toLowerCase();
//   }

//   List<int> encodeMessage(String message) {
//     final encodedMessage = message.codeUnits;
//     return encodedMessage;
//   }

//   Uint8List padSequence(List<int> sequence, {int maxlen = 80}) {
//     final paddedSequence = List<int>.filled(maxlen, 0);
//     final sequenceLength = sequence.length;
//     final truncatedSequence =
//         sequenceLength <= maxlen ? sequence : sequence.sublist(0, maxlen);
//     paddedSequence.setRange(0, truncatedSequence.length, truncatedSequence);
//     return Uint8List.fromList(paddedSequence);
//   }

//   Uint8List preprocessMessage(String message) {
//     final cleanedMessage = cleanMessage(message);
//     final encodedMessage = encodeMessage(cleanedMessage);
//     final paddedMessage = padSequence(encodedMessage, maxlen: 80);
//     return paddedMessage;
//   }
// }

// class _MessagesListView extends StatelessWidget {
//   const _MessagesListView({
//     Key? key,
//     required this.messages,
//     required this.onMessageTap,
//   }) : super(key: key);

//   final List<SmsMessage> messages;
//   final Function(SmsMessage) onMessageTap; // Callback function

//   @override
//   Widget build(BuildContext context) {
//     Map<String, List<SmsMessage>> groupedMessages = {};
//     for (var message in messages) {
//       String sender = message.sender!;
//       if (groupedMessages.containsKey(sender)) {
//         groupedMessages[sender]!.add(message);
//       } else {
//         groupedMessages[sender] = [message];
//       }
//     }

//     return ListView.builder(
//       shrinkWrap: true,
//       itemCount: groupedMessages.length,
//       itemBuilder: (BuildContext context, int i) {
//         String contactNumber = groupedMessages.keys.elementAt(i);
//         List<SmsMessage> contactMessages = groupedMessages[contactNumber]!;

//         SmsMessage latestMessage = contactMessages.first;

//         String messageBody = latestMessage.body ?? '';

//         return ListTile(
//           title: Text(contactNumber),
//           subtitle: Text(
//             messageBody.split('\n').first,
//             maxLines: 1,
//             overflow: TextOverflow.ellipsis,
//           ),
//           onTap: () =>
//               onMessageTap(latestMessage), // Trigger the callback function
//         );
//       },
//     );
//   }
// }

///////////////////////////////////////////////////
///REVISED BY CHATGPT
// import 'package:flutter/material.dart';
// import 'package:flutter_sms_inbox/flutter_sms_inbox.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'package:tflite_flutter/tflite_flutter.dart';
// import 'spam_page.dart';
// import 'dart:typed_data';

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'D-SpamPH',
//       theme: ThemeData(
//         primarySwatch: Colors.orange,
//       ),
//       home: HomePage(),
//     );
//   }
// }

// class HomePage extends StatefulWidget {
//   const HomePage({Key? key}) : super(key: key);

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   final SmsQuery _query = SmsQuery();
//   List<SmsMessage> _messages = [];
//   List<SmsMessage> _spamMessages = [];
//   late Interpreter _interpreter;
//   String prediction = '';

//   @override
//   void initState() {
//     super.initState();
//     loadModel();
//   }

//   Future<void> _handleMessageTap(SmsMessage message) async {
//     Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (context) => SpamPage(message: message),
//       ),
//     );

//     String newMessage = message.body ?? "";
//     print('Message: $newMessage');
//     String prediction = await predictMessage(newMessage);
//     print('Prediction: $prediction');
//   }

//   Future<void> loadModel() async {
//     try {
//       final interpreterOptions = InterpreterOptions();
//       _interpreter = await Interpreter.fromAsset(
//         'assets/model_lstm_09.20.23.tflite',
//         options: interpreterOptions,
//       );
//     } catch (e) {
//       print('Failed to load the TFLite model: $e');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('SMS Spam History'),
//       ),
//       body: Container(
//         padding: const EdgeInsets.all(10.0),
//         child: _spamMessages.isNotEmpty
//             ? _MessagesListView(
//                 messages: _spamMessages,
//                 onMessageTap: _handleMessageTap,
//               )
//             : Center(
//                 child: Text(
//                   'No spam messages to show.',
//                   style: Theme.of(context).textTheme.headline6,
//                   textAlign: TextAlign.center,
//                 ),
//               ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _refreshMessages,
//         child: const Icon(Icons.refresh),
//       ),
//     );
//   }

//   void _refreshMessages() async {
//     var permission = await Permission.sms.status;
//     if (permission.isGranted) {
//       final messages = await _query.querySms(
//         kinds: [SmsQueryKind.inbox],
//       );

//       // Detect spam messages
//       final spamMessages = await detectSpamMessages(messages);

//       setState(() {
//         _messages = messages;
//         _spamMessages = spamMessages;
//       });
//     } else {
//       await Permission.sms.request();
//     }
//   }

//   Future<List<SmsMessage>> _fetchThreadMessages(SmsMessage message) async {
//     if (message.threadId != null) {
//       List<SmsMessage> threadMessages = await _query.querySms(
//         threadId: message.threadId,
//         kinds: [SmsQueryKind.inbox],
//       );
//       return threadMessages;
//     }
//     return [];
//   }

//   Future<List<SmsMessage>> detectSpamMessages(List<SmsMessage> messages) async {
//     List<SmsMessage> spamMessages = [];

//     for (var message in messages) {
//       String prediction = await predictMessage(message.body ?? '');
//       if (prediction == 'Spam') {
//         spamMessages.add(message);
//       }
//     }

//     return spamMessages;
//   }

//   Future<String> predictMessage(String message) async {
//     if (!_isModelLoaded()) {
//       throw Exception('TFLite model is not loaded.');
//     }

//     try {
//       final input = preprocessMessage(message);
//       final output = List<double>.filled(2, 0.0);
//       final inputList = [input];
//       final outputList = [output];

//       final convertedInputList = inputList
//           .map((list) => list.map((value) => value.toDouble()).toList())
//           .toList();

//       final inputBuffer = convertedInputList.expand((x) => x).toList();
//       final outputBuffer = outputList.expand((x) => x).toList();

//       _interpreter.run(inputBuffer, outputBuffer);

//       final prediction = outputBuffer[0] > outputBuffer[1] ? 'Ham' : 'Spam';
//       return prediction;
//     } catch (e) {
//       print('Failed to make a prediction: $e');
//     }
//     return 'Unknown';
//   }

//   bool _isModelLoaded() {
//     return _interpreter != null;
//   }

//   String cleanMessage(String message) {
//     final cleanedText = message.replaceAll(RegExp('[^A-Za-z]'), ' ');
//     return cleanedText.toLowerCase();
//   }

//   List<int> encodeMessage(String message) {
//     final encodedMessage = message.codeUnits;
//     return encodedMessage;
//   }

//   Uint8List padSequence(List<int> sequence, {int maxlen = 80}) {
//     final paddedSequence = List<int>.filled(maxlen, 0);
//     final sequenceLength = sequence.length;
//     final truncatedSequence =
//         sequenceLength <= maxlen ? sequence : sequence.sublist(0, maxlen);
//     paddedSequence.setRange(0, truncatedSequence.length, truncatedSequence);
//     return Uint8List.fromList(paddedSequence);
//   }

//   Uint8List preprocessMessage(String message) {
//     final cleanedMessage = cleanMessage(message);
//     final encodedMessage = encodeMessage(cleanedMessage);
//     final paddedMessage = padSequence(encodedMessage, maxlen: 80);
//     return paddedMessage;
//   }
// }

// class _MessagesListView extends StatelessWidget {
//   const _MessagesListView({
//     Key? key,
//     required this.messages,
//     required this.onMessageTap,
//   }) : super(key: key);

//   final List<SmsMessage> messages;
//   final Function(SmsMessage) onMessageTap;

//   @override
//   Widget build(BuildContext context) {
//     Map<String, List<SmsMessage>> groupedMessages = {};
//     for (var message in messages) {
//       String sender = message.sender!;
//       if (groupedMessages.containsKey(sender)) {
//         groupedMessages[sender]!.add(message);
//       } else {
//         groupedMessages[sender] = [message];
//       }
//     }

//     return ListView.builder(
//       shrinkWrap: true,
//       itemCount: groupedMessages.length,
//       itemBuilder: (BuildContext context, int i) {
//         String contactNumber = groupedMessages.keys.elementAt(i);
//         List<SmsMessage> contactMessages = groupedMessages[contactNumber]!;
//         SmsMessage latestMessage = contactMessages.first;
//         String messageBody = latestMessage.body ?? '';

//         return ListTile(
//           title: Text(contactNumber),
//           subtitle: Text(
//             messageBody.split('\n').first,
//             maxLines: 1,
//             overflow: TextOverflow.ellipsis,
//           ),
//           onTap: () => onMessageTap(latestMessage),
//         );
//       },
//     );
//   }
// }
///////////////////////////////////////////////////
///STRING FILTER

import 'package:flutter/material.dart';
import 'package:flutter_sms_inbox/flutter_sms_inbox.dart';
import 'package:permission_handler/permission_handler.dart';
import 'spam_page.dart';
import 'app_drawer.dart';
import 'dart:async';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
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
  final SmsQuery _query = SmsQuery();
  final StreamController<List<SmsMessage>> _spamMessagesStreamController =
      StreamController<List<SmsMessage>>(); // Create a StreamController

  @override
  void initState() {
    super.initState();
    _initSmsListener();
  }

  @override
  void dispose() {
    _spamMessagesStreamController.close(); // Close the stream controller
    super.dispose();
  }

  void _initSmsListener() async {
    await Permission.sms.request();
    Timer.periodic(Duration(seconds: 30), (timer) {
      _refreshMessages();
    });
    _refreshMessages();
  }

  void _refreshMessages() async {
    final messages = await _query.querySms(
      kinds: [SmsQueryKind.inbox],
    );

    // Filter spam messages
    final spamMessages =
        messages.where((message) => _isSpam(message.body ?? '')).toList();

    // Add the updated list of spam messages to the stream
    _spamMessagesStreamController.sink.add(spamMessages);
  }

  Future<void> _handleMessageTap(SmsMessage message) async {
    String newMessage = message.body ?? "";
    if (_isSpam(newMessage)) {
      // Redirect to SpamPage for spam messages.
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SpamPage(message: message),
        ),
      );
    } else {
      // Handle non-spam messages here.
      print('Non-Spam Message: $newMessage');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SMS Spam History'),
      ),
      body: Container(
        padding: const EdgeInsets.all(10.0),
        child: StreamBuilder(
          stream: _spamMessagesStreamController.stream,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final spamMessages = snapshot.data as List<SmsMessage>;
              return spamMessages.isNotEmpty
                  ? _MessagesListView(
                      messages: spamMessages,
                      onMessageTap: _handleMessageTap,
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
      ),
      drawer: AppDrawer(context),
    );
  }

  bool _isSpam(String message) {
    final spamKeywords = [
      "free",
      "call",
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
}

class _MessagesListView extends StatelessWidget {
  const _MessagesListView({
    Key? key,
    required this.messages,
    required this.onMessageTap,
  }) : super(key: key);

  final List<SmsMessage> messages;
  final Function(SmsMessage) onMessageTap;

  @override
  Widget build(BuildContext context) {
    Map<String, List<SmsMessage>> groupedMessages = {};

    for (var message in messages) {
      String sender = message.address ?? 'Unknown Sender';
      if (groupedMessages.containsKey(sender)) {
        groupedMessages[sender]!.add(message);
      } else {
        groupedMessages[sender] = [message];
      }
    }

    return ListView.builder(
      shrinkWrap: true,
      itemCount: groupedMessages.length,
      itemBuilder: (BuildContext context, int i) {
        String contactNumber = groupedMessages.keys.elementAt(i);
        List<SmsMessage> contactMessages = groupedMessages[contactNumber]!;

        return ListTile(
          title: Text(contactNumber),
          subtitle: Text(
            contactMessages.first.body ?? 'No message body',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          onTap: () => onMessageTap(contactMessages.first),
        );
      },
    );
  }
}
