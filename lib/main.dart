// // // import 'package:dspamph/views/userside/loading_screen.dart';
// // import 'dart:js';
// import 'package:dspamph/views/userside/loading_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:dspamph/views/userside/preferences.dart';
// // import 'package:firebase_core/firebase_core.dart';
// // import 'firebase_options.dart';
// // import 'package:tflite/tflite.dart';
// // import 'package:dspamph/selection_page.dart';
// // import 'package:dspamph/views/userside/login_page.dart';
// // import 'package:dspamph/views/userside/login_verify_page.dart';
// // import 'package:dspamph/views/userside/homepage.dart';
// // import 'package:dspamph/views/userside/permission_popup.dart';

// // void main() async {
// //   // WidgetsFlutterBinding.ensureInitialized();
// //   // await Tflite.loadModel(
// //   //   model:
// //   //       'assets/model_lstm_09.20.23.tflite', // Provide the path to your TFLite model file
// //   // );
// //   runApp(const DSpamPhApp());
// // }

// void main() {
//   // WidgetsFlutterBinding.ensureInitialized();
//   // await Firebase.initializeApp(
//   //   options: DefaultFirebaseOptions.currentPlatform,
//   // );
//   runApp(
//     ChangeNotifierProvider(
//       create: (context) => ThemeNotifier(),
//       child: DSpamPhApp(), // Replace with your main app widget
//     ),
//   );
// }

// class DSpamPhApp extends StatelessWidget {
//   const DSpamPhApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Container(
//         color: Colors
//             .orange, // Set the background color of the entire app to white
//         child: LoadingScreen(),
//       ),
//       title: 'DSpamPH',
//       theme: ThemeData(
//         primarySwatch: Colors.orange,
//       ),
//       initialRoute: 'load',
//       debugShowCheckedModeBanner: false,
//       routes: {
//         'load': (context) => LoadingScreen(),
//         // 'selection': (context) => const SelectionPage(),
//         // 'phone': (context) => const LoginPage(),
//         // 'verify': (context) => const VerifyPage(),
//         // 'permission_popup': (context) => const PermissionPopup(),
//       },
//     );
//   }
// }

// // void main() {
// //   runApp(MaterialApp(
// //     initialRoute: 'selection',
// //     debugShowCheckedModeBanner: false,
// //     routes: {
// //       'selection': (context) => const SelectionPage(),
// //       'phone': (context) => const LoginPage(),
// //       'verify': (context) => const VerifyPage()
// //     },
// //   ));
// // }

import 'package:dspamph/views/userside/loading_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:dspamph/views/userside/preferences.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:dspamph/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeNotifier(),
      child: DSpamPhApp(), // Replace with your main app widget
    ),
  );
}

class DSpamPhApp extends StatelessWidget {
  const DSpamPhApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Container(
        color: Colors.orange,
        child: LoadingScreen(),
      ),
      title: 'DSpamPH',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      initialRoute: 'load',
      debugShowCheckedModeBanner: false,
      routes: {
        'load': (context) => LoadingScreen(),
      },
    );
  }
}
