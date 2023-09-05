// import 'package:flutter/material.dart';
// import 'block_success.dart';

// class SpamPage extends StatefulWidget {
//   const SpamPage({Key? key}) : super(key: key);

//   @override
//   _SpamPageState createState() => _SpamPageState();
// }

// class _SpamPageState extends State<SpamPage> {
//   void blockSpam() {
//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: const Text('Block Spam Message & Number'),
//           content: const Text(
//               'Are you sure you want to block this number and message then report it as spam?'),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => const BlockSuccessPage(),
//                   ),
//                 );
//                 // Implement your logic for blocking spam and reporting
//                 // Also navigate to the report details page (number 9 page)
//               },
//               child: const Text('Yes'),
//             ),
//             TextButton(
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//               child: const Text('Cancel'),
//             ),
//           ],
//         );
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           'Spam Details',
//           style: TextStyle(
//             color: Colors.white,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         backgroundColor: const Color.fromARGB(255, 38, 38, 38),
//         leading: IconButton(
//           icon: const Icon(
//             Icons.arrow_back,
//             color: Color.fromARGB(255, 255, 254, 254),
//           ),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//       ),
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           const Padding(
//             padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
//             child: Row(
//               children: [
//                 CircleAvatar(
//                   backgroundColor: Color.fromARGB(255, 50, 50, 50),
//                   radius: 20,
//                   child: Icon(
//                     Icons.account_circle,
//                     color: Colors.white,
//                   ),
//                 ),
//                 SizedBox(width: 10),
//                 Text(
//                   '09XXXXXXXXX',
//                   style: TextStyle(color: Colors.orange, fontSize: 18),
//                 ),
//               ],
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.fromLTRB(70, 10, 16, 16),
//             child: Container(
//               padding: const EdgeInsets.all(16),
//               child: const Text(
//                   'Complete message detail: Sample text, "Hello! Welcome to D-SpamPH. Click the link http://localhost:53467/#spam to see spam details.'),
//               decoration: BoxDecoration(
//                 color: Colors.grey[200],
//                 borderRadius: BorderRadius.circular(10),
//                 border: Border.all(color: Colors.grey),
//               ),
//             ),
//           ),
//           const Spacer(),
//           Container(
//             decoration: BoxDecoration(
//               color: Color.fromARGB(255, 214, 214, 214),
//               borderRadius: const BorderRadius.only(
//                 topLeft: Radius.circular(30),
//                 topRight: Radius.circular(30),
//               ),
//             ),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.all(10),
//                   child: Text(
//                     'OPTIONS',
//                     style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                   ),
//                 ),
//                 // const SizedBox(height: 20),
//                 Divider(
//                   // Add a divider here
//                   color: Color.fromARGB(255, 203, 203, 203),
//                   thickness: 2,
//                   height: 1,
//                 ),
//                 Row(
//                   children: [
//                     Expanded(
//                       child: TextButton(
//                         onPressed: blockSpam,
//                         child: const Text('Block Spam Message & Number',
//                             style: TextStyle(
//                                 color: Color.fromARGB(255, 223, 100, 38))),
//                         style: TextButton.styleFrom(
//                           padding: const EdgeInsets.all(36),
//                           alignment: Alignment.centerLeft,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:flutter_sms_inbox/flutter_sms_inbox.dart';

// class SpamPage extends StatelessWidget {
//   final SmsMessage message;

//   const SpamPage({required this.message});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Spam Message Details'),
//       ),
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           const Padding(
//             padding: EdgeInsets.all(16.0),
//             // child: Text(
//             //   message.body,
//             //   style: TextStyle(fontSize: 16),
//             // ),
//           ),
//           Padding(
//             padding: EdgeInsets.all(16.0),
//             child: ElevatedButton(
//               onPressed: () {
//                 // TODO: Implement blocking the number
//               },
//               child: Text('Block Number'),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:flutter_sms_inbox/flutter_sms_inbox.dart';

// class SpamPage extends StatelessWidget {
//   final SmsMessage message;
//   final List<SmsMessage> threadMessages;

//   const SpamPage(
//       {Key? key, required this.message, required this.threadMessages})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Spam Message'),
//       ),
//       body: Container(
//         padding: const EdgeInsets.all(10.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               'Full Message Detail:',
//               style: Theme.of(context).textTheme.titleLarge,
//             ),
//             const SizedBox(height: 10),
//             _buildMessageTile('Sender:', message.sender ?? ''),
//             _buildMessageTile('Date:', message.date.toString()),
//             const SizedBox(height: 20),
//             Expanded(
//               child: ListView.builder(
//                 itemCount: threadMessages.length + 1,
//                 itemBuilder: (BuildContext context, int index) {
//                   if (index == 0) {
//                     return _buildMessageTile('Body:', message.body ?? '');
//                   } else {
//                     SmsMessage otherMessage = threadMessages[index - 1];
//                     return _buildMessageTile(
//                       'Other Message:',
//                       otherMessage.body ?? '',
//                     );
//                   }
//                 },
//               ),
//             ),
//             const SizedBox(height: 20),
//             Align(
//               alignment: Alignment.bottomCenter,
//               child: ElevatedButton(
//                 onPressed: () {
//                   // Implement the code to block the number here
//                 },
//                 child: const Text('Block Number'),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildMessageTile(String title, String content) {
//     return Card(
//       child: ListTile(
//         title: Text(title),
//         subtitle: Text(content),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:flutter_sms_inbox/flutter_sms_inbox.dart';

// class SpamPage extends StatelessWidget {
//   final SmsMessage message;
//   final List<SmsMessage> threadMessages;

//   const SpamPage({
//     Key? key,
//     required this.message,
//     required this.threadMessages,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Spam Message'),
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: ListView.builder(
//               reverse: true,
//               itemCount: threadMessages.length + 1,
//               itemBuilder: (BuildContext context, int index) {
//                 if (index == 0) {
//                   return _buildMessageTile(message);
//                 } else {
//                   SmsMessage otherMessage = threadMessages[index - 1];
//                   return _buildMessageTile(otherMessage);
//                 }
//               },
//             ),
//           ),
//           ElevatedButton(
//             onPressed: () {
//               _blockNumber(message.sender);
//             },
//             child: const Text('Block Number'),
//           ),
//         ],
//       ),
//     );
//   }

//   void _blockNumber(String? phoneNumber) {
//     // Implement the backend code to block the phone number
//     // Here, you can make an API call or perform any other necessary action
//     if (phoneNumber != null) {
//       print('Blocking phone number: $phoneNumber');
//     } else {
//       print('Invalid phone number');
//     }
//   }

//   Widget _buildMessageTile(SmsMessage smsMessage) {
//     final isMe = smsMessage.sender == message.sender;

//     return Container(
//       alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
//       child: Padding(
//         padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//         child: Column(
//           crossAxisAlignment:
//               isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
//           children: [
//             Container(
//               padding: EdgeInsets.all(8),
//               decoration: BoxDecoration(
//                 color: isMe ? Colors.blue : Colors.grey[300],
//                 borderRadius: BorderRadius.circular(16),
//               ),
//               child: Text(
//                 smsMessage.body ?? '',
//                 style: TextStyle(
//                   color: isMe ? Colors.white : Colors.black,
//                 ),
//               ),
//             ),
//             SizedBox(height: 4),
//             Text(
//               smsMessage.sender ?? '',
//               style: TextStyle(
//                 fontWeight: FontWeight.bold,
//                 color: Colors.grey[600],
//               ),
//             ),
//             SizedBox(height: 2),
//             Text(
//               smsMessage.date.toString(),
//               style: TextStyle(
//                 fontSize: 12,
//                 color: Colors.grey[600],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:flutter_sms_inbox/flutter_sms_inbox.dart';
// import 'spam_detection.dart';
// import 'package:tflite_flutter/tflite_flutter.dart' as tfl;

// class SpamPage extends StatefulWidget {
//   final SmsMessage message;
//   final List<SmsMessage> threadMessages;

//   const SpamPage({
//     Key? key,
//     required this.message,
//     required this.threadMessages,
//   }) : super(key: key);

//   @override
//   _SpamPageState createState() => _SpamPageState();
// }

// class _SpamPageState extends State<SpamPage> {
//   bool _isNumberBlocked = false;

//   @override
//   void initState() {
//     super.initState();
//     loadModel();
//   }

//   loadModel() async {
//     // Load your model here if required
//     await tfl.Interpreter.fromAsset('assets/lstm_model.tflite');
//   }

//   @override
//   Widget build(BuildContext context) {
//     List<SmsMessage> allMessages = [widget.message, ...widget.threadMessages];
//     List<SmsMessage> uniqueMessages = _removeDuplicateMessages(allMessages);

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Spam Message'),
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: ListView.builder(
//               itemCount: uniqueMessages.length,
//               reverse: true,
//               itemBuilder: (BuildContext context, int index) {
//                 SmsMessage smsMessage = uniqueMessages[index];
//                 return FutureBuilder<int>(
//                   future: getSpamPrediction(smsMessage.body ?? ''),
//                   builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
//                     if (snapshot.hasData && snapshot.data == 0) {
//                       // Not spam, display the message tile
//                       return _buildMessageTile(smsMessage);
//                     } else {
//                       // Spam, hide the message tile
//                       return Container();
//                     }
//                   },
//                 );
//               },
//             ),
//           ),
//           if (!_isNumberBlocked)
//             ElevatedButton(
//               onPressed: () {
//                 _blockNumber(widget.message.sender.toString());
//               },
//               child: const Text('Block Number'),
//             ),
//         ],
//       ),
//     );
//   }

//   List<SmsMessage> _removeDuplicateMessages(List<SmsMessage> messages) {
//     List<SmsMessage> uniqueMessages = [];
//     Set<String> messageBodies = {};

//     for (SmsMessage message in messages) {
//       if (!messageBodies.contains(message.body)) {
//         uniqueMessages.add(message);
//         messageBodies.add(message.body.toString());
//       }
//     }

//     return uniqueMessages;
//   }

//   Widget _buildMessageTile(SmsMessage smsMessage) {
//     final isMe = smsMessage.sender == widget.message.sender;

//     return Container(
//       alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
//       child: Padding(
//         padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//         child: Column(
//           crossAxisAlignment:
//               isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
//           children: [
//             Container(
//               padding: EdgeInsets.all(8),
//               decoration: BoxDecoration(
//                 color: isMe ? Colors.blue : Colors.grey[300],
//                 borderRadius: BorderRadius.circular(16),
//               ),
//               child: Text(
//                 smsMessage.body ?? '',
//                 style: TextStyle(
//                   color: isMe ? Colors.white : Colors.black,
//                 ),
//               ),
//             ),
//             SizedBox(height: 4),
//             Text(
//               smsMessage.sender ?? '',
//               style: TextStyle(
//                 fontWeight: FontWeight.bold,
//                 color: Colors.grey[600],
//               ),
//             ),
//             SizedBox(height: 2),
//             Text(
//               smsMessage.date.toString(),
//               style: TextStyle(
//                 fontSize: 12,
//                 color: Colors.grey[600],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   void _blockNumber(String phoneNumber) {
//     // Add your backend code here to block the given phoneNumber
//     // For example, make an API request or update a database entry

//     setState(() {
//       _isNumberBlocked = true;
//     });
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_sms_inbox/flutter_sms_inbox.dart';
import 'spam_detection.dart';

class SpamPage extends StatefulWidget {
  final SmsMessage message;
  final List<SmsMessage> threadMessages;

  const SpamPage({
    Key? key,
    required this.message,
    required this.threadMessages,
  }) : super(key: key);

  @override
  _SpamPageState createState() => _SpamPageState();
}

class _SpamPageState extends State<SpamPage> {
  bool _isNumberBlocked = false;
  SpamDetection _spamDetection = SpamDetection();

  @override
  void initState() {
    super.initState();
    _spamDetection.loadModel();
  }

  @override
  Widget build(BuildContext context) {
    List<SmsMessage> allMessages = [widget.message, ...widget.threadMessages];
    List<SmsMessage> uniqueMessages = _removeDuplicateMessages(allMessages);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Spam Message'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: uniqueMessages.length,
              reverse: true,
              itemBuilder: (BuildContext context, int index) {
                SmsMessage smsMessage = uniqueMessages[index];
                return FutureBuilder<String>(
                  future: _spamDetection.predictMessage(smsMessage.body ?? ''),
                  builder:
                      (BuildContext context, AsyncSnapshot<String> snapshot) {
                    if (snapshot.hasData && snapshot.data == 'spam') {
                      // Spam message, display the message tile
                      return _buildMessageTile(smsMessage);
                    } else {
                      // Not spam, hide the message tile
                      return Container();
                    }
                  },
                );
              },
            ),
          ),
          if (!_isNumberBlocked)
            ElevatedButton(
              onPressed: () {
                _blockNumber(widget.message.sender.toString());
              },
              child: const Text('Block Number'),
            ),
        ],
      ),
    );
  }

  List<SmsMessage> _removeDuplicateMessages(List<SmsMessage> messages) {
    List<SmsMessage> uniqueMessages = [];
    Set<String> messageBodies = {};

    for (SmsMessage message in messages) {
      if (!messageBodies.contains(message.body)) {
        uniqueMessages.add(message);
        messageBodies.add(message.body.toString());
      }
    }

    return uniqueMessages;
  }

  Widget _buildMessageTile(SmsMessage smsMessage) {
    final isMe = smsMessage.sender == widget.message.sender;

    return Container(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          crossAxisAlignment:
              isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: isMe ? Colors.blue : Colors.grey[300],
                borderRadius: BorderRadius.circular(16),
              ),
              child: Text(
                smsMessage.body ?? '',
                style: TextStyle(
                  color: isMe ? Colors.white : Colors.black,
                ),
              ),
            ),
            SizedBox(height: 4),
            Text(
              smsMessage.sender ?? '',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.grey[600],
              ),
            ),
            SizedBox(height: 2),
            Text(
              smsMessage.date.toString(),
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _blockNumber(String phoneNumber) {
    // Add your backend code here to block the given phoneNumber
    // For example, make an API request or update a database entry

    setState(() {
      _isNumberBlocked = true;
    });
  }
}
