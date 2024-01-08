// // import 'package:dspamph/views/userside/homepage.dart';
// import 'package:flutter/material.dart';
// import 'package:pinput/pinput.dart';
// import 'permission_sms.dart';

// class VerifyPage extends StatefulWidget {
//   const VerifyPage({Key? key}) : super(key: key);

//   @override
//   State<VerifyPage> createState() => _VerifyPageState();
// }

// class _VerifyPageState extends State<VerifyPage> {
//   @override
//   Widget build(BuildContext context) {
//     final defaultPinTheme = PinTheme(
//       width: 56,
//       height: 56,
//       textStyle: const TextStyle(
//           fontSize: 20,
//           color: Color.fromRGBO(159, 77, 0, 1),
//           fontWeight: FontWeight.w600),
//       decoration: BoxDecoration(
//         border: Border.all(color: const Color.fromARGB(255, 239, 142, 101)),
//         borderRadius: BorderRadius.circular(20),
//       ),
//     );

//     final focusedPinTheme = defaultPinTheme.copyDecorationWith(
//       border: Border.all(color: const Color.fromARGB(255, 218, 58, 0)),
//       borderRadius: BorderRadius.circular(8),
//     );

//     final submittedPinTheme = defaultPinTheme.copyWith(
//       decoration: defaultPinTheme.decoration?.copyWith(
//         color: const Color.fromRGBO(255, 220, 180, 1),
//       ),
//     );

//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       extendBodyBehindAppBar: true,
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         leading: IconButton(
//           onPressed: () {
//             Navigator.pop(context);
//           },
//           icon: const Icon(
//             Icons.arrow_back_ios_rounded,
//             color: Colors.black,
//           ),
//         ),
//         elevation: 0,
//       ),
//       body: Container(
//         height: MediaQuery.of(context).size.height,
//         decoration: const BoxDecoration(
//           image: DecorationImage(
//             image: AssetImage('assets/images/login_userside.png'),
//             fit: BoxFit.cover,
//           ),
//         ),
//         child: Column(
//           children: [
//             Container(
//               margin: const EdgeInsets.only(top: 90, left: 25, right: 25),
//               alignment: Alignment.topCenter,
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Image.asset(
//                     'assets/images/dspamphlogo.png',
//                     width: 180,
//                     height: 180,
//                   ),
//                   const SizedBox(
//                     height: 20,
//                   ),
//                   const Text(
//                     "Phone Verification",
//                     style: TextStyle(
//                         fontSize: 22,
//                         fontWeight: FontWeight.bold,
//                         color: Color.fromARGB(255, 255, 255, 255)),
//                   ),
//                   const SizedBox(
//                     height: 5,
//                   ),
//                   const Text(
//                     "Please enter the phone verification code.",
//                     style: TextStyle(
//                         fontSize: 15,
//                         fontWeight: FontWeight.w200,
//                         color: Color.fromARGB(255, 255, 255, 255)),
//                     textAlign: TextAlign.center,
//                   ),
//                   const SizedBox(
//                     height: 90,
//                   ),
//                   Pinput(
//                     length: 6,
//                     defaultPinTheme: defaultPinTheme,
//                     focusedPinTheme: focusedPinTheme,
//                     submittedPinTheme: submittedPinTheme,
//                     showCursor: true,
//                     onCompleted: (pin) => print(pin),
//                   ),
//                   const SizedBox(
//                     height: 20,
//                   ),
//                   SizedBox(
//                     width: double.infinity,
//                     height: 45,
//                     child: ElevatedButton(
//                       style: ElevatedButton.styleFrom(
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                       ),
//                       onPressed: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => const PermissionSMS(),
//                           ),
//                         );
//                       },
//                       child: const Text(
//                         "Verify Phone Number",
//                         style: TextStyle(
//                             color: Colors.white, // Text color
//                             fontSize: 18, // Font size
//                             fontWeight: FontWeight.bold),
//                       ),
//                     ),
//                   ),
//                   Row(
//                     children: [
//                       TextButton(
//                         onPressed: () {
//                           Navigator.pushNamedAndRemoveUntil(
//                             context,
//                             'phone',
//                             (route) => false,
//                           );
//                         },
//                         child: const Text(
//                           "Edit Phone Number ?",
//                           style: TextStyle(color: Colors.black),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

/////////////////////////////////////////////////////
/// WITH OTP
// import 'package:flutter/material.dart';
// import 'package:pinput/pinput.dart';
// import 'permission_sms.dart';
// import 'package:firebase_auth/firebase_auth.dart';

// class VerifyPage extends StatefulWidget {
//   final String verificationId;

//   const VerifyPage({Key? key, required this.verificationId}) : super(key: key);

//   @override
//   State<VerifyPage> createState() => _VerifyPageState();
// }

// class _VerifyPageState extends State<VerifyPage> {
//   TextEditingController codeController = TextEditingController();

//   Future<void> _verifyOTP() async {
//     try {
//       // Use the code entered by the user
//       String pin = codeController.text.trim(); // Trim leading/trailing spaces

//       // Print for debugging
//       print('Verification ID: ${widget.verificationId}');
//       print('Entered OTP: $pin');

//       if (pin.isNotEmpty) {
//         // Use the stored verificationId when creating PhoneAuthCredential
//         PhoneAuthCredential credential = PhoneAuthProvider.credential(
//           verificationId: widget.verificationId,
//           smsCode: pin,
//         );

//         // Attempt to sign in with the provided credentials
//         UserCredential userCredential =
//             await FirebaseAuth.instance.signInWithCredential(credential);

//         // Check if the user is authenticated (verification is successful)
//         if (userCredential.user != null) {
//           // Verification successful
//           print('OTP verification successful!');

//           // TODO: You can perform any additional actions upon successful verification.
//           // For example, navigate to the PermissionSMS screen.
//           Navigator.pushReplacement(
//             context,
//             MaterialPageRoute(
//               builder: (context) => const PermissionSMS(),
//             ),
//           );
//         } else {
//           // Verification failed
//           print('OTP verification failed. User is not authenticated.');

//           // TODO: You can handle the failure, show an error message, or take appropriate action.
//         }
//       } else {
//         print('Entered OTP is empty. Please enter a valid OTP.');
//       }
//     } catch (e) {
//       print('Error during OTP verification: $e');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     final defaultPinTheme = PinTheme(
//       width: 56,
//       height: 56,
//       textStyle: const TextStyle(
//           fontSize: 20,
//           color: Color.fromRGBO(159, 77, 0, 1),
//           fontWeight: FontWeight.w600),
//       decoration: BoxDecoration(
//         border: Border.all(color: const Color.fromARGB(255, 239, 142, 101)),
//         borderRadius: BorderRadius.circular(20),
//       ),
//     );

//     final focusedPinTheme = defaultPinTheme.copyDecorationWith(
//       border: Border.all(color: const Color.fromARGB(255, 218, 58, 0)),
//       borderRadius: BorderRadius.circular(8),
//     );

//     final submittedPinTheme = defaultPinTheme.copyWith(
//       decoration: defaultPinTheme.decoration?.copyWith(
//         color: const Color.fromRGBO(255, 220, 180, 1),
//       ),
//     );

//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       extendBodyBehindAppBar: true,
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         leading: IconButton(
//           onPressed: () {
//             Navigator.pop(context);
//           },
//           icon: const Icon(
//             Icons.arrow_back_ios_rounded,
//             color: Colors.black,
//           ),
//         ),
//         elevation: 0,
//       ),
//       body: Container(
//         height: MediaQuery.of(context).size.height,
//         decoration: const BoxDecoration(
//           image: DecorationImage(
//             image: AssetImage('assets/images/login_userside.png'),
//             fit: BoxFit.cover,
//           ),
//         ),
//         child: Column(
//           children: [
//             Container(
//               margin: const EdgeInsets.only(top: 90, left: 25, right: 25),
//               alignment: Alignment.topCenter,
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Image.asset(
//                     'assets/images/dspamphlogo.png',
//                     width: 180,
//                     height: 180,
//                   ),
//                   const SizedBox(
//                     height: 20,
//                   ),
//                   const Text(
//                     "Phone Verification",
//                     style: TextStyle(
//                         fontSize: 22,
//                         fontWeight: FontWeight.bold,
//                         color: Color.fromARGB(255, 255, 255, 255)),
//                   ),
//                   const SizedBox(
//                     height: 5,
//                   ),
//                   const Text(
//                     "Please enter the phone verification code.",
//                     style: TextStyle(
//                         fontSize: 15,
//                         fontWeight: FontWeight.w200,
//                         color: Color.fromARGB(255, 255, 255, 255)),
//                     textAlign: TextAlign.center,
//                   ),
//                   const SizedBox(
//                     height: 90,
//                   ),
//                   Pinput(
//                     length: 6,
//                     defaultPinTheme: defaultPinTheme,
//                     focusedPinTheme: focusedPinTheme,
//                     submittedPinTheme: submittedPinTheme,
//                     showCursor: true,
//                     onCompleted: (pin) {
//                       // Update the controller with the entered OTP
//                       codeController.text = pin;
//                       // Print for debugging
//                       print('Entered OTP: $pin');
//                     },
//                   ),
//                   const SizedBox(
//                     height: 20,
//                   ),
//                   SizedBox(
//                     width: double.infinity,
//                     height: 45,
//                     child: ElevatedButton(
//                       style: ElevatedButton.styleFrom(
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                       ),
//                       onPressed: _verifyOTP,
//                       child: const Text(
//                         "Verify Phone Number",
//                         style: TextStyle(
//                             color: Colors.white, // Text color
//                             fontSize: 18, // Font size
//                             fontWeight: FontWeight.bold),
//                       ),
//                     ),
//                   ),
//                   Row(
//                     children: [
//                       TextButton(
//                         onPressed: () {
//                           Navigator.pushNamedAndRemoveUntil(
//                             context,
//                             'phone',
//                             (route) => false,
//                           );
//                         },
//                         child: const Text(
//                           "Edit Phone Number ?",
//                           style: TextStyle(color: Colors.black),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

//////////////////////////////////////////////////////
/// WITHOUT OTP
/// login_verify_page.dart
// import 'package:flutter/material.dart';
// import 'package:pinput/pinput.dart';
// import 'permission_sms.dart';

// class VerifyPage extends StatefulWidget {
//   const VerifyPage({Key? key}) : super(key: key);

//   @override
//   State<VerifyPage> createState() => _VerifyPageState();
// }

// class _VerifyPageState extends State<VerifyPage> {
//   @override
//   Widget build(BuildContext context) {
//     final defaultPinTheme = PinTheme(
//       width: 56,
//       height: 56,
//       textStyle: const TextStyle(
//           fontSize: 20,
//           color: Color.fromRGBO(159, 77, 0, 1),
//           fontWeight: FontWeight.w600),
//       decoration: BoxDecoration(
//         border: Border.all(color: const Color.fromARGB(255, 239, 142, 101)),
//         borderRadius: BorderRadius.circular(20),
//       ),
//     );

//     final focusedPinTheme = defaultPinTheme.copyDecorationWith(
//       border: Border.all(color: const Color.fromARGB(255, 218, 58, 0)),
//       borderRadius: BorderRadius.circular(8),
//     );

//     final submittedPinTheme = defaultPinTheme.copyWith(
//       decoration: defaultPinTheme.decoration?.copyWith(
//         color: const Color.fromRGBO(255, 220, 180, 1),
//       ),
//     );

//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       extendBodyBehindAppBar: true,
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         leading: IconButton(
//           onPressed: () {
//             Navigator.pop(context);
//           },
//           icon: const Icon(
//             Icons.arrow_back_ios_rounded,
//             color: Colors.black,
//           ),
//         ),
//         elevation: 0,
//       ),
//       body: Container(
//         height: MediaQuery.of(context).size.height,
//         decoration: const BoxDecoration(
//           image: DecorationImage(
//             image: AssetImage('assets/images/login_userside.png'),
//             fit: BoxFit.cover,
//           ),
//         ),
//         child: Column(
//           children: [
//             Container(
//               margin: const EdgeInsets.only(top: 90, left: 25, right: 25),
//               alignment: Alignment.topCenter,
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Image.asset(
//                     'assets/images/dspamphlogo.png',
//                     width: 180,
//                     height: 180,
//                   ),
//                   const SizedBox(
//                     height: 20,
//                   ),
//                   const Text(
//                     "Phone Verification",
//                     style: TextStyle(
//                         fontSize: 22,
//                         fontWeight: FontWeight.bold,
//                         color: Color.fromARGB(255, 255, 255, 255)),
//                   ),
//                   const SizedBox(
//                     height: 5,
//                   ),
//                   const Text(
//                     "Please enter the phone verification code.",
//                     style: TextStyle(
//                         fontSize: 15,
//                         fontWeight: FontWeight.w200,
//                         color: Color.fromARGB(255, 255, 255, 255)),
//                     textAlign: TextAlign.center,
//                   ),
//                   const SizedBox(
//                     height: 90,
//                   ),
//                   Pinput(
//                     length: 6,
//                     defaultPinTheme: defaultPinTheme,
//                     focusedPinTheme: focusedPinTheme,
//                     submittedPinTheme: submittedPinTheme,
//                     showCursor: true,
//                     onCompleted: (pin) => print(pin),
//                   ),
//                   const SizedBox(
//                     height: 20,
//                   ),
//                   SizedBox(
//                     width: double.infinity,
//                     height: 45,
//                     child: ElevatedButton(
//                       style: ElevatedButton.styleFrom(
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                       ),
//                       onPressed: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => const PermissionSMS(),
//                           ),
//                         );
//                       },
//                       child: const Text(
//                         "Verify Phone Number",
//                         style: TextStyle(
//                             color: Colors.white, // Text color
//                             fontSize: 18, // Font size
//                             fontWeight: FontWeight.bold),
//                       ),
//                     ),
//                   ),
//                   Row(
//                     children: [
//                       TextButton(
//                         onPressed: () {
//                           Navigator.pushNamedAndRemoveUntil(
//                             context,
//                             'phone',
//                             (route) => false,
//                           );
//                         },
//                         child: const Text(
//                           "Edit Phone Number ?",
//                           style: TextStyle(color: Colors.black),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

//////////////////////////////////////////////////
/// From Allady
/// login_verify_page.dart
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'permission_sms.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CustomSlidePageRoute extends PageRouteBuilder {
  final Widget page;

  CustomSlidePageRoute({required this.page})
      : super(
          pageBuilder: (context, animation, secondaryAnimation) => page,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(1.0, 0.0);
            const end = Offset.zero;
            const curve = Curves.easeInOut;

            var tween =
                Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

            var offsetAnimation = animation.drive(tween);

            return SlideTransition(
              position: offsetAnimation,
              child: child,
            );
          },
        );
}

class VerifyPage extends StatefulWidget {
  final String verificationId;

  const VerifyPage({Key? key, required this.verificationId}) : super(key: key);

  @override
  State<VerifyPage> createState() => _VerifyPageState();
}

class _VerifyPageState extends State<VerifyPage> {
  TextEditingController codeController = TextEditingController();
  bool isVerifying = false;

  Future<void> _verifyOTP() async {
    try {
      // Set isVerifying to true to change the button color and show the CircularProgressIndicator
      setState(() {
        isVerifying = true;
      });

      // Use the code entered by the user
      String pin = codeController.text.trim(); // Trim leading/trailing spaces

      // Print for debugging
      print('Verification ID: ${widget.verificationId}');
      print('Entered OTP: $pin');

      if (pin.isNotEmpty) {
        // Use the stored verificationId when creating PhoneAuthCredential
        PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: widget.verificationId,
          smsCode: pin,
        );

        // Attempt to sign in with the provided credentials
        UserCredential userCredential =
            await FirebaseAuth.instance.signInWithCredential(credential);

        // Check if the user is authenticated (verification is successful)
        if (userCredential.user != null) {
          // Verification successful
          print('OTP verification successful!');

          // TODO: You can perform any additional actions upon successful verification.
          // For example, navigate to the PermissionSMS screen.
          Navigator.pushReplacement(
            context,
            CustomSlidePageRoute(page: PermissionSMS()),
          );
        } else {
          // Verification failed
          print('OTP verification failed. User is not authenticated.');

          // TODO: You can handle the failure, show an error message, or take appropriate action.
        }
      } else {
        print('Entered OTP is empty. Please enter a valid OTP.');
      }

      // Set isVerifying back to false after verification is complete
      setState(() {
        isVerifying = false;
      });
    } catch (e) {
      print('Error during OTP verification: $e');
      // Handle the error
      // Set isVerifying back to false in case of an error
      setState(() {
        isVerifying = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(
          fontSize: 20,
          color: Color.fromRGBO(159, 77, 0, 1),
          fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        border: Border.all(color: const Color.fromARGB(255, 239, 142, 101)),
        borderRadius: BorderRadius.circular(20),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: const Color.fromARGB(255, 218, 58, 0)),
      borderRadius: BorderRadius.circular(8),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: const Color.fromRGBO(255, 220, 180, 1),
      ),
    );

    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_rounded,
            color: Colors.black,
          ),
        ),
        elevation: 0,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/login_userside.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 90, left: 25, right: 25),
                alignment: Alignment.topCenter,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/dspamphlogo.png',
                      width: 180,
                      height: 180,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "Phone Verification",
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 255, 255, 255)),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Text(
                      "Enter phone verification code.",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w200,
                          color: Color.fromARGB(255, 255, 255, 255)),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 100,
                    ),
                    Pinput(
                      length: 6,
                      defaultPinTheme: defaultPinTheme,
                      focusedPinTheme: focusedPinTheme,
                      submittedPinTheme: submittedPinTheme,
                      showCursor: true,
                      onCompleted: (pin) {
                        // Update the controller with the entered OTP
                        codeController.text = pin;
                        // Print for debugging
                        print('Entered OTP: $pin');
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 45,
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color.fromARGB(255, 255, 123, 0),
                              Color.fromARGB(255, 255, 186, 11)
                            ],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: isVerifying
                                ? Colors.grey
                                : Colors
                                    .transparent, // Change color to grey when verifying
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          onPressed: isVerifying
                              ? null
                              : _verifyOTP, // Disable the button when verifying
                          child: isVerifying
                              ? Center(
                                  child: CircularProgressIndicator(
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                        Colors.white),
                                  ),
                                )
                              : const Text(
                                  "VERIFY",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Edit Phone Number? ",
                            style: TextStyle(
                              color: Color.fromARGB(255, 60, 130, 165),
                              // Add other styling properties as needed
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.pop(
                                    context); // Navigate back or perform the desired action
                              },
                          ),
                          TextSpan(
                            text:
                                "Please wait for the OTP code; it might take some time. If not received, make sure the entered phone number is correct and valid.",
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
