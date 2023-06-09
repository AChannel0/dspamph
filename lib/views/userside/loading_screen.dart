import 'package:flutter/material.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    // initialization
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset('assets/images/dspamphlogo.png'),
    );
  }
}
