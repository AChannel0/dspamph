import 'package:flutter/material.dart';

class ReportSpams extends StatefulWidget {
  final int totalSpamMessages;

  const ReportSpams({super.key, required this.totalSpamMessages});

  @override
  _ReportSpamsState createState() => _ReportSpamsState();
}

class _ReportSpamsState extends State<ReportSpams> {
  bool agreedToTerms = false;

  @override
  void initState() {
    super.initState();
    // Add any initialization code here
  }

  void report() {
    if (agreedToTerms) {
      // Implement your report logic here
    } else {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Terms and Conditions'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'By agreeing to the terms and conditions, you partake into contributing...'),
                CheckboxListTile(
                  value: agreedToTerms,
                  onChanged: (value) {
                    setState(() {
                      agreedToTerms = value!;
                    });
                  },
                  title: const Text('I agree'),
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Close'),
              ),
            ],
          );
        },
      );
    }
  }

 @override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: const Text('Report Spams'),
    ),
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'Total number of spams to report:',
            style: TextStyle(fontSize: 20),
          ),
          Text(
            widget.totalSpamMessages.toString(),
            style: const TextStyle(fontSize: 30),
          ),
          const Text('spam messages'),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: report,
            child: const Text('REPORT'),
          ),
        ],
      ),
    ),
  );
}}