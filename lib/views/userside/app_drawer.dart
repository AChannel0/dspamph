import 'package:flutter/material.dart';
import 'package:dspamph/views/userside/login_page.dart';
import 'package:dspamph/views/userside/preferences.dart'; // Import the preferences page

class AppDrawer extends StatelessWidget {
  final BuildContext context;
  final Map<String, int> spamMessageCountByDate;

  AppDrawer(
    this.context, {
    required this.spamMessageCountByDate,
  });

  void logout() {
    // Implement your logout logic here
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const LoginPage()),
    );
  }

  // Define a TextStyle with a font size of 20
  final TextStyle _listTileTextStyle = TextStyle(fontSize: 18);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(
            title: Text(
              'Settings',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            automaticallyImplyLeading: false, // Removes the back button
            backgroundColor: Theme.of(context).primaryColor,
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: Text(
              'Switch Account',
              style: _listTileTextStyle, // Apply the TextStyle here
            ),
            onTap: () {
              // Redirect to the LoginPage when "Switch Account" is tapped
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: Text(
              'Preferences',
              style: _listTileTextStyle, // Apply the TextStyle here
            ),
            onTap: () {
              // Redirect to the Preferences page when "Preferences" is tapped
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        PreferencesPage()), // Replace with your preferences page
              );
            },
          ),
          ListTile(
            title: Text(
              'Logout',
              style: TextStyle(
                color: Colors.orange,
                fontSize: 18,
              ),
            ),
            onTap: logout,
          ),
        ],
      ),
    );
  }
}
