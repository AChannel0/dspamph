import 'package:flutter/material.dart';
import 'package:dspamph/views/userside/login_page.dart';
import 'package:dspamph/views/userside/preferences.dart'; // Import the preferences page
import 'package:dspamph/views/userside/spam_reports_history.dart';

class AppDrawer extends StatelessWidget {
  final BuildContext context;
  final Map<String, int> spamMessageCountByDate;
  final List<String> uploadedSpamData;
  final List<String> uploadedTime;
  final List<String> uploadedSender;

  AppDrawer(this.context,
      {super.key,
      required this.spamMessageCountByDate,
      required this.uploadedSpamData,
      required this.uploadedTime,
      required this.uploadedSender});

  void logout() {
    // Implement logout logic here
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
            automaticallyImplyLeading: false,
            backgroundColor: Theme.of(context).primaryColor,
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: Text(
              'Switch Account',
              style: _listTileTextStyle,
            ),
            onTap: () {
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
              style: _listTileTextStyle,
            ),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => PreferencesPage(),
                ),
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
