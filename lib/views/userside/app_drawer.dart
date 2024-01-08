// app_drawer.dart
import 'package:flutter/material.dart';
import 'package:dspamph/views/userside/login_page.dart';
import 'package:dspamph/views/userside/about.dart'; // Import the about page

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
            leading: const Icon(Icons.info), // Added Icon for "About Us"
            title: Text(
              'About Us',
              style: _listTileTextStyle,
            ),
            onTap: () {
              Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) =>
                      AboutPage(),
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) {
                    const begin = Offset(1.0, 0.0);
                    const end = Offset.zero;
                    const curve = Curves.easeInOut;

                    var tween = Tween(begin: begin, end: end).chain(
                      CurveTween(curve: curve),
                    );

                    var offsetAnimation = animation.drive(tween);

                    return SlideTransition(
                      position: offsetAnimation,
                      child: child,
                    );
                  },
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
