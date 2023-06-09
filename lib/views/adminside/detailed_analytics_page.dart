import 'package:flutter/material.dart';

class DetailedAnalyticsPage extends StatelessWidget {
  const DetailedAnalyticsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detailed Analytics'),
      ),
      body: const Center(
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
