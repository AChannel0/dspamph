import 'package:flutter/material.dart';

class DetailedAnalyticsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detailed Analytics'),
      ),
      body: Center(
        child: Text(
          'Detailed Analytics Page',
          style: TextStyle(
            fontSize: 24,
          ),
        ),
      ),
    );
  }
}
