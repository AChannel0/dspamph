import 'package:flutter/material.dart';

class ReportSpams extends StatefulWidget {
  final int totalSpamMessages;

  ReportSpams({required this.totalSpamMessages});

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
            title: Text('Terms and Conditions'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                    'By agreeing to the terms and conditions, you partake into contributing...'),
                CheckboxListTile(
                  value: agreedToTerms,
                  onChanged: (value) {
                    setState(() {
                      agreedToTerms = value!;
                    });
                  },
                  title: Text('I agree'),
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Close'),
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
        title: Text('Report Spams'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Total number of spams to report:',
            style: TextStyle(fontSize: 20),
          ),
          Text(
            widget.totalSpamMessages.toString(),
            style: TextStyle(fontSize: 30),
          ),
          Text('spam messages'),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: report,
            child: Text('REPORT'),
          ),
        ],
      ),
    );
  }
}
