// // import 'package:dspamph/views/userside/loading_screen.dart';
// import 'dart:js';
import 'package:flutter/material.dart';
import 'package:dspamph/selection_page.dart';
import 'package:dspamph/views/userside/login_page.dart';
import 'package:dspamph/views/userside/login_verify_page.dart';

import 'package:flutter/material.dart';
import 'package:dspamph/selection_page.dart';
import 'package:dspamph/views/userside/login_page.dart';
import 'package:dspamph/views/userside/login_verify_page.dart';

void main() {
  runApp(DSpamPhApp());
}

class DSpamPhApp extends StatelessWidget {
  const DSpamPhApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DSpamPH',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      initialRoute: 'selection',
      debugShowCheckedModeBanner: false,
      routes: {
        'selection': (context) => const SelectionPage(),
        'phone': (context) => const LoginPage(),
        'verify': (context) => const VerifyPage(),
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

