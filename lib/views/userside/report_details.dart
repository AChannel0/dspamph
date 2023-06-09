import 'package:flutter/material.dart';

class ReportDetails extends StatefulWidget {
  const ReportDetails({super.key});

  @override
  _ReportDetailsState createState() => _ReportDetailsState();
}

class _ReportDetailsState extends State<ReportDetails> {
  @override
  void initState() {
    super.initState();
    // Add any initialization code here
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Report Details'),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Message and number successfully blocked and reported!',
              style: TextStyle(fontSize: 20),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Icon(
              Icons.check_circle,
              color: Colors.orange,
              size: 50,
            ),
          ],
        ),
      ),
    );
  }
}
