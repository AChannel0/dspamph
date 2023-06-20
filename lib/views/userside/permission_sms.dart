import 'package:dspamph/views/userside/homepage.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter/services.dart';

class PermissionSMS extends StatefulWidget {
  const PermissionSMS({Key? key}) : super(key: key);

  @override
  _PermissionSMSState createState() => _PermissionSMSState();
}

class _PermissionSMSState extends State<PermissionSMS> {
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
  //}

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.orange,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarIconBrightness: Brightness.dark,
    ));
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Permission"),
          backgroundColor: Colors.white,
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              ListTile(
                leading: const CircleAvatar(
                  child: Icon(Icons.message),
                ),
                onTap: () async {
                  PermissionStatus smsStatus = await Permission.sms.request();
                  if (smsStatus.isGranted) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const HomePage()),
                    );
                  }
                  if (smsStatus.isDenied) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("This permission is recommended"),
                      ),
                    );
                  }
                  if (smsStatus.isPermanentlyDenied) {
                    openAppSettings();
                  }
                },
                title: const Text("SMS Permission"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
