import 'package:dspamph/views/userside/homepage.dart';
import 'package:flutter/material.dart';

import 'login_page.dart';

class PermissionPopup extends StatefulWidget {
  const PermissionPopup({super.key});

  @override
  _PermissionPopupState createState() => _PermissionPopupState();
}

class _PermissionPopupState extends State<PermissionPopup> {
  // bool allowPermission = false;

  @override
  void initState() {
    super.initState();
    // initialization
  }

  // void denyPermission() {
  //   // permission logic here
  // }

  // void allowPermission() {
  //   // permission logic here
  // }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.message),
          const Text('Allow D-SpamPH to view and manage SMS messages?'),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginPage()));
              },
                child: const Text('DENY'),
              ),
              TextButton(
                onPressed:() {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage()));
                },
                child: const Text('ALLOW'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
