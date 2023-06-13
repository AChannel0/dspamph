// import 'package:flutter/material.dart';
// import 'dart:async';
// import 'package:sms/sms.dart';

// class MessagesScreen extends StatefulWidget {
//   MessagesScreen({Key key}) : super(key: key);

//   @override
//   _MessagesScreenState createState() => _MessagesScreenState();
// }

// class _MessagesScreenState extends State<MessagesScreen> {
//   List _allMessages;
//   @override
//   void initState() {
//     super.initState();

//     getAllMessages();
//   }

//   Future getAllMessages() async {
//     SmsQuery query = new SmsQuery();
//     List<SmsMessage> messages = await query.getAllSms;
//     debugPrint("Total Messages : " + messages.length.toString());
//     print(messages);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Messages"),
//       ),
//       body: ListView.builder(
//         itemCount: 1,
//         itemBuilder: (BuildContext context, int index) {
//           return Text("Test");
//         },
//       ),
//     );
//   }
// }