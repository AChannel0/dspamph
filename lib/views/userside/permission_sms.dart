// import 'package:dspamph/views/userside/homepage.dart';
// import 'package:flutter/material.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'package:flutter/services.dart';

// class PermissionSMS extends StatefulWidget {
//   const PermissionSMS({Key? key}) : super(key: key);

//   @override
//   _PermissionSMSState createState() => _PermissionSMSState();
// }

// class _PermissionSMSState extends State<PermissionSMS> {
//   // bool allowPermission = false;

//   @override
//   void initState() {
//     super.initState();
//     // initialization
//   }

//   // void denyPermission() {
//   //   // permission logic here
//   // }

//   // void allowPermission() {
//   //   // permission logic here
//   //}

//   @override
//   Widget build(BuildContext context) {
//     SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
//       statusBarColor: Colors.orange,
//       systemNavigationBarColor: Colors.white,
//       systemNavigationBarIconBrightness: Brightness.dark,
//     ));
//     return SafeArea(
//       child: Scaffold(
//         appBar: AppBar(
//           title: const Text("Permission"),
//           backgroundColor: Colors.white,
//           centerTitle: true,
//         ),
//         body: SingleChildScrollView(
//           child: Column(
//             children: [
//               ListTile(
//                 leading: const CircleAvatar(
//                   child: Icon(Icons.message),
//                 ),
//                 onTap: () async {
//                   PermissionStatus smsStatus = await Permission.sms.request();
//                   if (smsStatus.isGranted) {
//                     Navigator.pushReplacement(
//                       context,
//                       MaterialPageRoute(builder: (context) => HomePage()),
//                     );
//                   }
//                   if (smsStatus.isDenied) {
//                     ScaffoldMessenger.of(context).showSnackBar(
//                       const SnackBar(
//                         content: Text("This permission is recommended"),
//                       ),
//                     );
//                   }
//                   if (smsStatus.isPermanentlyDenied) {
//                     openAppSettings();
//                   }
//                 },
//                 title: const Text("SMS Permission"),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

////////////////////////////////////////
// permission_sms.dart
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
  Future<PermissionStatus>? _permissionStatus;

  @override
  void initState() {
    super.initState();
    _permissionStatus = Permission.sms.status;
    _checkPermissionStatus();
  }

  Future<void> _checkPermissionStatus() async {
    final permissionStatus = await _permissionStatus;
    if (permissionStatus?.isGranted == true) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _navigateToHomePage();
      });
    }
  }

  void _navigateToHomePage() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const HomePage(),
      ),
    );
  }

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
        body: FutureBuilder<PermissionStatus>(
          future: _permissionStatus,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }

            final permissionStatus = snapshot.data;

            if (permissionStatus == null || permissionStatus.isDenied) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    ListTile(
                      leading: const CircleAvatar(
                        child: Icon(Icons.message),
                      ),
                      onTap: () async {
                        final smsStatus = await Permission.sms.request();
                        setState(() {
                          _permissionStatus = Future.value(smsStatus);
                        });
                        if (smsStatus.isGranted) {
                          _navigateToHomePage();
                        } else if (smsStatus.isPermanentlyDenied) {
                          openAppSettings();
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("This permission is recommended"),
                            ),
                          );
                        }
                      },
                      title: const Text("SMS Permission"),
                    ),
                  ],
                ),
              );
            }

            return const SizedBox(); // Placeholder widget, won't be visible
          },
        ),
      ),
    );
  }
}
