import 'package:flutter/material.dart';
import 'package:dspamph/selection_page.dart';
import 'package:dspamph/views/userside/view_spam_analytics.dart';

class AppDrawer extends StatelessWidget {
  final BuildContext context;

  const AppDrawer(this.context, {super.key});

  void logout() {
    // Implement your logout logic here
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const SelectionPage()),
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
            child: const Text(
              'Settings',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('View Spam Analytics'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const ViewSpamAnalytics()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Switch Account'),
            onTap: () {
              // Implement your switch account logic here
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Preferences'),
            onTap: () {
              // Implement your preferences logic here
            },
          ),
          ListTile(
            title: const Text(
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
