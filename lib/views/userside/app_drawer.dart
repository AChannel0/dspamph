import 'package:flutter/material.dart';
import 'package:dspamph/selection_page.dart';
import 'package:dspamph/views/userside/view_spam_analytics.dart';
class AppDrawer extends StatelessWidget {
  final BuildContext context;

  const AppDrawer(this.context);

  void logout() {
    // Implement your logout logic here
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => SelectionPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
            ),
            child: Text(
              'Settings',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('View Spam Analytics'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ViewSpamAnalytics()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Switch Account'),
            onTap: () {
              // Implement your switch account logic here
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
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
