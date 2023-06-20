// import 'dart:html';

// import 'package:dspamph/views/userside/homepage.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'block_success.dart';
import 'login_page.dart';
import 'package:flutter/services.dart';
import 'package:permission_handler_platform_interface/permission_handler_platform_interface.dart';

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
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginPage()));
                },
                child: const Text('DENY'),
              ),
              TextButton(
                onPressed: () async {
                  PermissionStatus smsStatus = await Permission.sms.request();
                  if (smsStatus == PermissionStatus.granted) {
                    (context) => const BlockSuccessPage();
                  }
                  if (smsStatus == PermissionStatus.denied) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("This permission is recommended")));
                  }
                  if (smsStatus == PermissionStatus.permanentlyDenied) {
                    openAppSettings();
                  }
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
