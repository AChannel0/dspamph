import 'package:dspamph/selection_page.dart';
import 'package:flutter/material.dart';
import 'package:dspamph/views/userside/view_spam_analytics.dart';

class AppDrawer extends StatefulWidget {
  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  @override
  void initState() {
    super.initState();
    // Add any initialization code here
  }

  void logout() {
    // Implement your logout logic here
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => SelectionPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text('View Spam Analytics'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ViewSpamAnalytics()),
              );
            },
          ),
          ListTile(
            title: Text('Switch Account'),
            onTap: () {
              // Implement your switch account logic here
            },
          ),
          ListTile(
            title: Text('Preferences'),
            onTap: () {
              // Implement your preferences logic here
            },
          ),
          ListTile(
            title: Text(
              'Logout',
              style: TextStyle(color: Colors.orange),
            ),
            onTap: logout,
          ),
        ],
      ),
    );
  }
}
