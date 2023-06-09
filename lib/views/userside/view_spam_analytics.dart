import 'package:flutter/material.dart';

class ViewSpamAnalytics extends StatefulWidget {
  const ViewSpamAnalytics({super.key});

  @override
  _ViewSpamAnalyticsState createState() => _ViewSpamAnalyticsState();
}

class _ViewSpamAnalyticsState extends State<ViewSpamAnalytics> {
  @override
  void initState() {
    super.initState();
    // Add any initialization code here
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Reports History'),
        titleTextStyle: const TextStyle(color: Colors.white),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Current Date',
            style: TextStyle(fontSize: 20),
          ),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.all(16),
            color: Colors.grey[200],
            child: const Column(
              children: [
                Text(
                  'TOTAL SPAM REPORTS',
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: 20),
                ListTile(
                  title: Text('Today'),
                  subtitle: Text('Number of received spam and unique spam'),
                ),
                ListTile(
                  title: Text('Yesterday'),
                  subtitle: Text('Number of received spam and unique spam'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
