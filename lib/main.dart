// import 'package:dspamph/views/userside/loading_screen.dart';
import 'package:flutter/material.dart';
// import 'package:dspamph/views/userside/homepage.dart';
import 'package:dspamph/selection_page.dart';
// import 'package:dspamph/views/userside/login_page.dart';

void main() => runApp(const DSpamPhApp());

class DSpamPhApp extends StatelessWidget {
  const DSpamPhApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DSpamPH',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: const SelectionPage(), // temporary
    );
  }
}







// class MainScreen extends StatefulWidget {
//   @override
//   _MainScreenState createState() => _MainScreenState();
// }

// class _MainScreenState extends State<MainScreen> {
//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         // body: LoadingScreen(),
//         );
//   }
// }
