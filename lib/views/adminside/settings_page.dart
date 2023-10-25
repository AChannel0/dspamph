import 'package:flutter/material.dart';
import 'package:dspamph/login_page.dart';

class SettingsPage extends StatelessWidget {
  final BuildContext context;

  const SettingsPage(this.context, {super.key});

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
              'Administrator ID',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Profile'),
            onTap: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //       builder: (context) => const ViewSpamAnalytics()),
              // );
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
