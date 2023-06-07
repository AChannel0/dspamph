import 'package:flutter/material.dart';

class ViewSpamAnalytics extends StatefulWidget {
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
        title: Text('User Reports History'),
        titleTextStyle: TextStyle(color: Colors.white),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Current Date',
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(height: 20),
          Container(
            padding: EdgeInsets.all(16),
            color: Colors.grey[200],
            child: Column(
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
