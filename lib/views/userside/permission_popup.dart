import 'package:dspamph/views/userside/homepage.dart';
import 'package:flutter/material.dart';

import 'login_page.dart';

class PermissionPopup extends StatefulWidget {
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
          Icon(Icons.message),
          Text('Allow D-SpamPH to view and manage SMS messages?'),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
              },
                child: Text('DENY'),
              ),
              TextButton(
                onPressed:() {
                Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
                },
                child: Text('ALLOW'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
