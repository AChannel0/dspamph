// main.dart
import 'package:dspamph/views/userside/loading_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:dspamph/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    const DSpamPhApp(),
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
