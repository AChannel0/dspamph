// // import 'package:dspamph/views/userside/loading_screen.dart';
// import 'dart:js';
import 'package:dspamph/views/userside/loading_screen.dart';
import 'package:flutter/material.dart';
// import 'package:dspamph/selection_page.dart';
// import 'package:dspamph/views/userside/login_page.dart';
// import 'package:dspamph/views/userside/login_verify_page.dart';
// import 'package:dspamph/views/userside/homepage.dart';

// import 'package:flutter/material.dart';
// import 'package:dspamph/selection_page.dart';
// import 'package:dspamph/views/userside/login_page.dart';
// import 'package:dspamph/views/userside/login_verify_page.dart';

void main() {
  runApp(const DSpamPhApp());
}

class DSpamPhApp extends StatelessWidget {
  const DSpamPhApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Container(
        color: Colors
            .orange, // Set the background color of the entire app to white
        child: LoadingScreen(),
      ),
      title: 'DSpamPH',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      initialRoute: 'load',
      debugShowCheckedModeBanner: false,
      routes: {
        // 'selection': (context) => const SelectionPage(),
        // 'phone': (context) => const LoginPage(),
        // 'verify': (context) => const VerifyPage(),
        // 'home': (context) => const HomePage(),
        'load': (context) => LoadingScreen(),
      },
    );
  }
}


// void main() {
//   runApp(MaterialApp(
//     initialRoute: 'selection',
//     debugShowCheckedModeBanner: false,
//     routes: {
//       'selection': (context) => const SelectionPage(),
//       'phone': (context) => const LoginPage(),
//       'verify': (context) => const VerifyPage()
//     },
//   ));
// }

