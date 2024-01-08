// import 'package:flutter/material.dart';
// import 'login_verify_page.dart';

// class LoginPage extends StatefulWidget {
//   const LoginPage({Key? key}) : super(key: key);

//   @override
//   State<LoginPage> createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   TextEditingController countryController = TextEditingController();

//   @override
//   void initState() {
//     countryController.text = "+63";
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
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
//         margin: const EdgeInsets.only(left: 25, right: 25),
//         alignment: Alignment.center,
//         child: SingleChildScrollView(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Image.asset(
//                 'assets/images/dspamphlogo.png',
//                 width: 150,
//                 height: 150,
//               ),
//               const SizedBox(
//                 height: 20,
//               ),
//               const Text(
//                 "Phone Verification",
//                 style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
//               ),
//               const SizedBox(
//                 height: 100,
//               ),
//               Container(
//                 height: 55,
//                 decoration: BoxDecoration(
//                   border: Border.all(width: 1, color: Colors.grey),
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     const SizedBox(
//                       width: 10,
//                     ),
//                     SizedBox(
//                       width: 40,
//                       child: TextField(
//                         controller: countryController,
//                         keyboardType: TextInputType.number,
//                         decoration: const InputDecoration(
//                           border: InputBorder.none,
//                         ),
//                       ),
//                     ),
//                     const Text(
//                       "|",
//                       style: TextStyle(fontSize: 33, color: Colors.grey),
//                     ),
//                     const SizedBox(
//                       width: 10,
//                     ),
//                     const Expanded(
//                       child: TextField(
//                         keyboardType: TextInputType.phone,
//                         decoration: InputDecoration(
//                           border: InputBorder.none,
//                           hintText: "Phone",
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               const SizedBox(
//                 height: 20,
//               ),
//               SizedBox(
//                 width: double.infinity,
//                 height: 45,
//                 child: ElevatedButton(
//                   style: ButtonStyle(
//                     backgroundColor:
//                         MaterialStateProperty.all<Color>(Colors.orange),
//                     shape: MaterialStateProperty.all<RoundedRectangleBorder>(
//                       RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                     ),
//                   ),
//                   onPressed: () {
//                     // Navigator.pushNamed(context, 'verify');
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                           builder: (context) => const VerifyPage()),
//                     );
//                   },
//                   child: const Text("Send OTP"),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

//////////////////////////////////////////////////////////////////////////////////////

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             SizedBox(height: 50),
//             Container(
//               height: 100,
//               width: 100,
//               child: Image.asset('images/dspamphlogo.png'),
//             ),
//             SizedBox(height: 10),
//             Center(
//               child: Text(
//                 'D-SpamPH',
//                 style: TextStyle(
//                   fontWeight: FontWeight.bold,
//                   fontSize: 18,
//                 ),
//               ),
//             ),
//             SizedBox(height: 50),
//             SizedBox(
//               width: 100,
//               child: TextField(
//                 onChanged: (value) {},
//                 decoration: InputDecoration(
//                   labelText: 'Number',
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10.0),
//                     borderSide: BorderSide(color: Colors.grey),
//                   ),
//                   filled: true,
//                   fillColor: Colors.grey[200],
//                 ),
//               ),
//             ),
//             SizedBox(height: 20),
//             SizedBox(
//               width: 100,
//               child: TextField(
//                 onChanged: (value) {},
//                 decoration: InputDecoration(
//                   labelText: 'One-Time-Pin (OTP)',
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10.0),
//                     borderSide: BorderSide(color: Colors.grey),
//                   ),
//                   filled: true,
//                   fillColor: Colors.grey[200],
//                 ),
//               ),
//             ),
//             SizedBox(height: 10),
//             Align(
//               alignment: Alignment.centerLeft,
//               child: TextButton(
//                 onPressed: () {},
//                 child: Text(
//                   'Click here to send OTP',
//                   style: TextStyle(
//                     color: Colors.blue,
//                     fontSize: 12,
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(height: 20),
//             TextButton(
//               onPressed: () {
//                 Navigator.push(context,
//                     MaterialPageRoute(builder: (context) => PermissionPopup()));
//               },
//               child: Container(
//                 width: 150,
//                 height: 40,
//                 decoration: BoxDecoration(
//                   color: Colors.grey,
//                   borderRadius: BorderRadius.circular(10.0),
//                 ),
//                 child: Center(
//                   child: Text(
//                     'LOGIN',
//                     style: TextStyle(
//                       color: const Color.fromARGB(255, 0, 0, 0),
//                       fontSize: 16,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(height: 10), // Add this SizedBox for spacing
//             TextButton(
//               onPressed: () {
//                 Navigator.push(context,
//                     MaterialPageRoute(builder: (context) => SelectionPage()));
//               },
//               child: Container(
//                 width: 150,
//                 height: 40,
//                 decoration: BoxDecoration(
//                   color: Colors.grey,
//                   borderRadius: BorderRadius.circular(10.0),
//                 ),
//                 child: Center(
//                   child: Text(
//                     'GO BACK',
//                     style: TextStyle(
//                       color: const Color.fromARGB(255, 0, 0, 0),
//                       fontSize: 16,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

///////////////////////////////////////////////////////////
///
// import 'package:flutter/material.dart';
// import 'login_verify_page.dart';

// class LoginPage extends StatefulWidget {
//   const LoginPage({Key? key}) : super(key: key);

//   @override
//   State<LoginPage> createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   TextEditingController countryController = TextEditingController();

//   @override
//   void initState() {
//     countryController.text = "+63";
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     var container = Container(
//       height: 55,
//       decoration: BoxDecoration(
//         border: Border.all(width: 1, color: Colors.grey),
//         borderRadius: BorderRadius.circular(10),
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           const SizedBox(
//             width: 10,
//           ),
//           SizedBox(
//             width: 40,
//             child: TextField(
//               controller: countryController,
//               keyboardType: TextInputType.number,
//               decoration: const InputDecoration(
//                 border: InputBorder.none,
//               ),
//             ),
//           ),
//           const Text(
//             "|",
//             style: TextStyle(fontSize: 33, color: Colors.grey),
//           ),
//           const SizedBox(
//             width: 10,
//           ),
//           const Expanded(
//             child: TextField(
//               keyboardType: TextInputType.phone,
//               decoration: InputDecoration(
//                 border: InputBorder.none,
//                 hintText: "Phone",
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//     var sizedBox = SizedBox(
//       width: double.infinity,
//       height: 45,
//       child: ElevatedButton(
//         style: ElevatedButton.styleFrom(
//           primary: Colors.orange, // Background color
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(10),
//           ),
//         ),
//         onPressed: () {
//           // Navigator.pushNamed(context, 'verify');
//           Navigator.push(
//             context,
//             MaterialPageRoute(builder: (context) => const VerifyPage()),
//           );
//         },
//         child: const Text(
//           "Send OTP",
//           style: TextStyle(
//               color: Colors.white, // Text color
//               fontSize: 18, // Font size
//               fontWeight: FontWeight.bold),
//         ),
//       ),
//     );
//     var textButton = TextButton(
//       onPressed: () {
//         // Navigate to the terms and conditions page (EULA).
//         // Replace 'TermsAndConditionsPage' with the actual page name.
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (context) => const TermsAndConditionsPage(),
//           ),
//         );
//       },
//       child: const Text(
//         "terms and conditions.",
//         style: TextStyle(
//           fontSize: 15,
//           fontWeight: FontWeight.normal,
//           color: Colors.blue,
//           decoration: TextDecoration.underline,
//         ),
//       ),
//     );
//     return Scaffold(
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
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             Container(
//               height: MediaQuery.of(context).size.height,
//               decoration: const BoxDecoration(
//                 image: DecorationImage(
//                   image: AssetImage('assets/images/login_userside.png'),
//                   fit: BoxFit.cover,
//                 ),
//               ),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.stretch,
//                 children: [
//                   const SizedBox(
//                     height: 90,
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 30),
//                     child: Column(
//                       children: [
//                         Image.asset(
//                           'assets/images/dspamphlogo.png',
//                           width: 180,
//                           height: 180,
//                         ),
//                         const SizedBox(
//                           height: 20,
//                         ),
//                         const Text(
//                           "Phone Verification",
//                           style: TextStyle(
//                             fontSize: 22,
//                             fontWeight: FontWeight.bold,
//                             color: Color.fromARGB(255, 255, 255, 255),
//                           ),
//                         ),
//                         const SizedBox(
//                           height: 5,
//                         ),
//                         const Text(
//                           "Enter phone number.",
//                           style: TextStyle(
//                             fontSize: 15,
//                             fontWeight: FontWeight.w200,
//                             color: Color.fromARGB(255, 255, 255, 255),
//                           ),
//                         ),
//                         const SizedBox(
//                           height: 100,
//                         ),
//                         container,
//                         const SizedBox(
//                           height: 20,
//                         ),
//                         sizedBox,
//                         const SizedBox(
//                           height: 200,
//                         ),
//                         const Text(
//                           "By continuing, you waive to agree to our",
//                           style: TextStyle(
//                             fontSize: 15,
//                             fontWeight: FontWeight.normal,
//                             color: Color.fromARGB(255, 0, 0, 0),
//                           ),
//                         ),
//                         textButton,
//                       ],
//                     ),
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

// class TermsAndConditionsPage extends StatelessWidget {
//   const TermsAndConditionsPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Terms and Conditions"),
//       ),
//       body: const Padding(
//         padding: EdgeInsets.all(16.0),
//         child: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 "End-User License Agreement (EULA) for D-SpamPH:\n\n",
//                 style: TextStyle(
//                   fontWeight: FontWeight.bold,
//                   fontSize: 20,
//                 ),
//               ),
//               Text(
//                 "This End-User License Agreement (“Agreement”) is a legal agreement between you and AMC IT Solutions for the use of D-SpamPH, an SMS spam filtering application (“Software”).\n\n"
//                 "By installing, copying, or otherwise using the Software, you agree to be bound by the terms of this Agreement.\n\n"
//                 "1. License Grant AMC IT Solutions grants you a non-exclusive, non-transferable license to use the Software on a single device.\n\n"
//                 "2. Compliance with Laws You agree to comply with all applicable laws and regulations in connection with your use of the Software. This includes, but is not limited to, compliance with the Subscriber Identity Module (SIM) Registration Act or Republic Act No. 11934 and the Data Privacy Act of 2012 or Republic Act No. 10173 of the Philippines.\n\n"
//                 "3. Data Protection AMC IT Solutions will process any personal data collected through your use of the Software in accordance with the Data Privacy Act of 2012 or Republic Act No. 10173 of the Philippines. AMC IT Solutions will take appropriate technical and organizational measures to protect your personal data against unauthorized or unlawful processing and against accidental loss, destruction or damage.\n\n"
//                 "4. Restrictions You may not reverse engineer, decompile, or disassemble the Software. You may not rent, lease, or lend the Software.\n\n"
//                 "5. Termination This Agreement will terminate automatically if you fail to comply with any of its terms and conditions. Upon termination, you must immediately cease all use of the Software and destroy all copies of the Software in your possession.\n\n"
//                 "6. Disclaimer of Warranties The Software is provided “AS IS” without warranty of any kind. AMC IT Solutions disclaims all warranties, either express or implied, including but not limited to implied warranties of merchantability and fitness for a particular purpose.\n\n"
//                 "7. of Liability In no event shall [Company Name] be liable for any damages whatsoever arising out of the use or inability to use the Software.\n\n"
//                 "8. Governing Law This Agreement shall be governed by and construed in accordance with the laws of the Philippines.",
//                 style: TextStyle(fontSize: 15),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

//////////////////////////////////////
/// WITH OTP
// import 'package:flutter/material.dart';
// import 'login_verify_page.dart';
// import 'package:firebase_auth/firebase_auth.dart';

// class LoginPage extends StatefulWidget {
//   const LoginPage({Key? key}) : super(key: key);

//   @override
//   State<LoginPage> createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   TextEditingController countryController = TextEditingController();
//   TextEditingController phoneNumberController = TextEditingController();
//   String verificationId = "";

//   @override
//   void initState() {
//     countryController.text = "+63";
//     super.initState();
//   }

//   Future<void> _verifyPhoneNumber() async {
//     try {
//       final country = countryController.text;
//       final phoneNumber = phoneNumberController.text;

//       if (country.isNotEmpty &&
//           phoneNumber.isNotEmpty &&
//           _isValidPhoneNumber(phoneNumber)) {
//         await FirebaseAuth.instance.verifyPhoneNumber(
//           phoneNumber: country + phoneNumber,
//           verificationCompleted: (PhoneAuthCredential credential) async {
//             await FirebaseAuth.instance.signInWithCredential(credential);
//           },
//           verificationFailed: (FirebaseAuthException e) {
//             print('Verification failed: ${e.message}');
//           },
//           codeSent: (String verificationId, int? resendToken) {
//             this.verificationId = verificationId;

//             Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (context) =>
//                     VerifyPage(verificationId: verificationId),
//               ),
//             );
//           },
//           codeAutoRetrievalTimeout: (String verificationId) {
//             print('Code auto retrieval timeout');
//           },
//         );
//       } else {
//         print('Invalid country code or phone number format.');
//       }
//     } catch (e) {
//       print('Error during phone number verification: $e');
//     }
//   }

//   bool _isValidPhoneNumber(String phoneNumber) {
//     // Implement your validation logic here
//     // For example, you can use regular expressions to check for a valid format.
//     return RegExp(r'^[0-9]+$').hasMatch(phoneNumber);
//   }

//   @override
//   Widget build(BuildContext context) {
//     var container = Container(
//       height: 55,
//       decoration: BoxDecoration(
//         border: Border.all(width: 1, color: Colors.grey),
//         borderRadius: BorderRadius.circular(10),
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           const SizedBox(
//             width: 10,
//           ),
//           SizedBox(
//             width: 40,
//             child: TextField(
//               controller: countryController,
//               keyboardType: TextInputType.number,
//               decoration: const InputDecoration(
//                 border: InputBorder.none,
//               ),
//             ),
//           ),
//           const Text(
//             "|",
//             style: TextStyle(fontSize: 33, color: Colors.grey),
//           ),
//           const SizedBox(
//             width: 10,
//           ),
//           Expanded(
//             child: TextField(
//               controller: phoneNumberController, // Add this line
//               keyboardType: TextInputType.phone,
//               decoration: InputDecoration(
//                 border: InputBorder.none,
//                 hintText: "Phone",
//               ),
//             ),
//           ),
//         ],
//       ),
//     );

//     var sizedBox = SizedBox(
//       width: double.infinity,
//       height: 45,
//       child: ElevatedButton(
//         style: ElevatedButton.styleFrom(
//           primary: Colors.orange, // Background color
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(10),
//           ),
//         ),
//         onPressed: _verifyPhoneNumber,
//         child: const Text(
//           "Send OTP",
//           style: TextStyle(
//               color: Colors.white, // Text color
//               fontSize: 18, // Font size
//               fontWeight: FontWeight.bold),
//         ),
//       ),
//     );
//     var textButton = TextButton(
//       onPressed: () {
//         // Navigate to the terms and conditions page (EULA).
//         // Replace 'TermsAndConditionsPage' with the actual page name.
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (context) => const TermsAndConditionsPage(),
//           ),
//         );
//       },
//       child: const Text(
//         "terms and conditions.",
//         style: TextStyle(
//           fontSize: 15,
//           fontWeight: FontWeight.normal,
//           color: Colors.blue,
//           decoration: TextDecoration.underline,
//         ),
//       ),
//     );
//     return Scaffold(
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
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             Container(
//               height: MediaQuery.of(context).size.height,
//               decoration: const BoxDecoration(
//                 image: DecorationImage(
//                   image: AssetImage('assets/images/login_userside.png'),
//                   fit: BoxFit.cover,
//                 ),
//               ),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.stretch,
//                 children: [
//                   const SizedBox(
//                     height: 90,
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 30),
//                     child: Column(
//                       children: [
//                         Image.asset(
//                           'assets/images/dspamphlogo.png',
//                           width: 180,
//                           height: 180,
//                         ),
//                         const SizedBox(
//                           height: 20,
//                         ),
//                         const Text(
//                           "Phone Verification",
//                           style: TextStyle(
//                             fontSize: 22,
//                             fontWeight: FontWeight.bold,
//                             color: Color.fromARGB(255, 255, 255, 255),
//                           ),
//                         ),
//                         const SizedBox(
//                           height: 5,
//                         ),
//                         const Text(
//                           "Enter phone number.",
//                           style: TextStyle(
//                             fontSize: 15,
//                             fontWeight: FontWeight.w200,
//                             color: Color.fromARGB(255, 255, 255, 255),
//                           ),
//                         ),
//                         const SizedBox(
//                           height: 100,
//                         ),
//                         container,
//                         const SizedBox(
//                           height: 20,
//                         ),
//                         sizedBox,
//                         const SizedBox(
//                           height: 200,
//                         ),
//                         const Text(
//                           "By continuing, you waive to agree to our",
//                           style: TextStyle(
//                             fontSize: 15,
//                             fontWeight: FontWeight.normal,
//                             color: Color.fromARGB(255, 0, 0, 0),
//                           ),
//                         ),
//                         textButton,
//                       ],
//                     ),
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

// class TermsAndConditionsPage extends StatelessWidget {
//   const TermsAndConditionsPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Terms and Conditions"),
//       ),
//       body: const Padding(
//         padding: EdgeInsets.all(16.0),
//         child: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 "End-User License Agreement (EULA) for D-SpamPH:\n\n",
//                 style: TextStyle(
//                   fontWeight: FontWeight.bold,
//                   fontSize: 20,
//                 ),
//               ),
//               Text(
//                 "This End-User License Agreement (“Agreement”) is a legal agreement between you and AMC IT Solutions for the use of D-SpamPH, an SMS spam filtering application (“Software”).\n\n"
//                 "By installing, copying, or otherwise using the Software, you agree to be bound by the terms of this Agreement.\n\n"
//                 "1. License Grant AMC IT Solutions grants you a non-exclusive, non-transferable license to use the Software on a single device.\n\n"
//                 "2. Compliance with Laws You agree to comply with all applicable laws and regulations in connection with your use of the Software. This includes, but is not limited to, compliance with the Subscriber Identity Module (SIM) Registration Act or Republic Act No. 11934 and the Data Privacy Act of 2012 or Republic Act No. 10173 of the Philippines.\n\n"
//                 "3. Data Protection AMC IT Solutions will process any personal data collected through your use of the Software in accordance with the Data Privacy Act of 2012 or Republic Act No. 10173 of the Philippines. AMC IT Solutions will take appropriate technical and organizational measures to protect your personal data against unauthorized or unlawful processing and against accidental loss, destruction or damage.\n\n"
//                 "4. Restrictions You may not reverse engineer, decompile, or disassemble the Software. You may not rent, lease, or lend the Software.\n\n"
//                 "5. Termination This Agreement will terminate automatically if you fail to comply with any of its terms and conditions. Upon termination, you must immediately cease all use of the Software and destroy all copies of the Software in your possession.\n\n"
//                 "6. Disclaimer of Warranties The Software is provided “AS IS” without warranty of any kind. AMC IT Solutions disclaims all warranties, either express or implied, including but not limited to implied warranties of merchantability and fitness for a particular purpose.\n\n"
//                 "7. of Liability In no event shall [Company Name] be liable for any damages whatsoever arising out of the use or inability to use the Software.\n\n"
//                 "8. Governing Law This Agreement shall be governed by and construed in accordance with the laws of the Philippines.",
//                 style: TextStyle(fontSize: 15),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

////////////////////////////////////////////////////////
/// WITHOUT OTP
/// login_page.dart
// import 'package:flutter/material.dart';
// import 'login_verify_page.dart';

// class LoginPage extends StatefulWidget {
//   const LoginPage({Key? key}) : super(key: key);

//   @override
//   State<LoginPage> createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   TextEditingController countryController = TextEditingController();

//   @override
//   void initState() {
//     countryController.text = "+63";
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     var container = Container(
//       height: 55,
//       decoration: BoxDecoration(
//         border: Border.all(width: 1, color: Colors.grey),
//         borderRadius: BorderRadius.circular(10),
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           const SizedBox(
//             width: 10,
//           ),
//           SizedBox(
//             width: 40,
//             child: TextField(
//               controller: countryController,
//               keyboardType: TextInputType.number,
//               decoration: const InputDecoration(
//                 border: InputBorder.none,
//               ),
//             ),
//           ),
//           const Text(
//             "|",
//             style: TextStyle(fontSize: 33, color: Colors.grey),
//           ),
//           const SizedBox(
//             width: 10,
//           ),
//           const Expanded(
//             child: TextField(
//               keyboardType: TextInputType.phone,
//               decoration: InputDecoration(
//                 border: InputBorder.none,
//                 hintText: "Phone",
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//     var sizedBox = SizedBox(
//       width: double.infinity,
//       height: 45,
//       child: ElevatedButton(
//         style: ElevatedButton.styleFrom(
//           primary: Colors.orange, // Background color
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(10),
//           ),
//         ),
//         onPressed: () {
//           // Navigator.pushNamed(context, 'verify');
//           Navigator.push(
//             context,
//             MaterialPageRoute(
//                 builder: (context) => const VerifyPage(
//                     // verificationId: '',
//                     )),
//           );
//         },
//         child: const Text(
//           "Send OTP",
//           style: TextStyle(
//               color: Colors.white, // Text color
//               fontSize: 18, // Font size
//               fontWeight: FontWeight.bold),
//         ),
//       ),
//     );
//     var textButton = TextButton(
//       onPressed: () {
//         // Navigate to the terms and conditions page (EULA).
//         // Replace 'TermsAndConditionsPage' with the actual page name.
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (context) => const TermsAndConditionsPage(),
//           ),
//         );
//       },
//       child: const Text(
//         "terms and conditions.",
//         style: TextStyle(
//           fontSize: 15,
//           fontWeight: FontWeight.normal,
//           color: Colors.blue,
//           decoration: TextDecoration.underline,
//         ),
//       ),
//     );
//     return Scaffold(
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
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             Container(
//               height: MediaQuery.of(context).size.height,
//               decoration: const BoxDecoration(
//                 image: DecorationImage(
//                   image: AssetImage('assets/images/login_userside.png'),
//                   fit: BoxFit.cover,
//                 ),
//               ),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.stretch,
//                 children: [
//                   const SizedBox(
//                     height: 90,
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 30),
//                     child: Column(
//                       children: [
//                         Image.asset(
//                           'assets/images/dspamphlogo.png',
//                           width: 180,
//                           height: 180,
//                         ),
//                         const SizedBox(
//                           height: 20,
//                         ),
//                         const Text(
//                           "Phone Verification",
//                           style: TextStyle(
//                             fontSize: 22,
//                             fontWeight: FontWeight.bold,
//                             color: Color.fromARGB(255, 255, 255, 255),
//                           ),
//                         ),
//                         const SizedBox(
//                           height: 5,
//                         ),
//                         const Text(
//                           "Enter phone number.",
//                           style: TextStyle(
//                             fontSize: 15,
//                             fontWeight: FontWeight.w200,
//                             color: Color.fromARGB(255, 255, 255, 255),
//                           ),
//                         ),
//                         const SizedBox(
//                           height: 100,
//                         ),
//                         container,
//                         const SizedBox(
//                           height: 20,
//                         ),
//                         sizedBox,
//                         const SizedBox(
//                           height: 200,
//                         ),
//                         const Text(
//                           "By continuing, you waive to agree to our",
//                           style: TextStyle(
//                             fontSize: 15,
//                             fontWeight: FontWeight.normal,
//                             color: Color.fromARGB(255, 0, 0, 0),
//                           ),
//                         ),
//                         textButton,
//                       ],
//                     ),
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

// class TermsAndConditionsPage extends StatelessWidget {
//   const TermsAndConditionsPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Terms and Conditions"),
//       ),
//       body: const Padding(
//         padding: EdgeInsets.all(16.0),
//         child: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 "End-User License Agreement (EULA) for D-SpamPH:\n\n",
//                 style: TextStyle(
//                   fontWeight: FontWeight.bold,
//                   fontSize: 20,
//                 ),
//               ),
//               Text(
//                 "This End-User License Agreement (“Agreement”) is a legal agreement between you and AMC IT Solutions for the use of D-SpamPH, an SMS spam filtering application (“Software”).\n\n"
//                 "By installing, copying, or otherwise using the Software, you agree to be bound by the terms of this Agreement.\n\n"
//                 "1. License Grant AMC IT Solutions grants you a non-exclusive, non-transferable license to use the Software on a single device.\n\n"
//                 "2. Compliance with Laws You agree to comply with all applicable laws and regulations in connection with your use of the Software. This includes, but is not limited to, compliance with the Subscriber Identity Module (SIM) Registration Act or Republic Act No. 11934 and the Data Privacy Act of 2012 or Republic Act No. 10173 of the Philippines.\n\n"
//                 "3. Data Protection AMC IT Solutions will process any personal data collected through your use of the Software in accordance with the Data Privacy Act of 2012 or Republic Act No. 10173 of the Philippines. AMC IT Solutions will take appropriate technical and organizational measures to protect your personal data against unauthorized or unlawful processing and against accidental loss, destruction or damage.\n\n"
//                 "4. Restrictions You may not reverse engineer, decompile, or disassemble the Software. You may not rent, lease, or lend the Software.\n\n"
//                 "5. Termination This Agreement will terminate automatically if you fail to comply with any of its terms and conditions. Upon termination, you must immediately cease all use of the Software and destroy all copies of the Software in your possession.\n\n"
//                 "6. Disclaimer of Warranties The Software is provided “AS IS” without warranty of any kind. AMC IT Solutions disclaims all warranties, either express or implied, including but not limited to implied warranties of merchantability and fitness for a particular purpose.\n\n"
//                 "7. of Liability In no event shall [Company Name] be liable for any damages whatsoever arising out of the use or inability to use the Software.\n\n"
//                 "8. Governing Law This Agreement shall be governed by and construed in accordance with the laws of the Philippines.",
//                 style: TextStyle(fontSize: 15),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

/////////////////////////////////////////////////
/// From Allady
/// login_page.dart
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'login_verify_page.dart';
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

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController countryController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  String verificationId = "";
  bool isButtonClicked = false;
  String errorMessage = "";

  @override
  void initState() {
    countryController.text = "+63";
    super.initState();
  }

  Future<void> _verifyPhoneNumber() async {
    try {
      final country = countryController.text;
      final phoneNumber = phoneNumberController.text;

      if (country.isNotEmpty &&
          phoneNumber.isNotEmpty &&
          _isValidPhoneNumber(phoneNumber)) {
        if (phoneNumber.length < 10) {
          setState(() {
            errorMessage = 'Phone number is too short.';
          });
          return;
        }

        setState(() {
          isButtonClicked = true;
          errorMessage = '';
        });

        await Future.delayed(Duration(seconds: 5)); // Simulating delay

        await FirebaseAuth.instance.verifyPhoneNumber(
          phoneNumber: country + phoneNumber,
          verificationCompleted: (PhoneAuthCredential credential) async {
            await FirebaseAuth.instance.signInWithCredential(credential);
          },
          verificationFailed: (FirebaseAuthException e) {
            print('Error: ${e.message}');
            setState(() {
              errorMessage = 'Invalid phone number.';
            });
          },
          codeSent: (String verificationId, int? resendToken) {
            this.verificationId = verificationId;

            Navigator.push(
              context,
              CustomSlidePageRoute(
                  page: VerifyPage(verificationId: verificationId)),
            );
          },
          codeAutoRetrievalTimeout: (String verificationId) {
            print('Code auto retrieval timeout');
          },
        );
      } else {
        print('Invalid country code or phone number format.');
        setState(() {
          errorMessage = 'Please enter a valid phone number.';
        });
      }
    } catch (e) {
      print('A problem occurred during phone number verification: $e');
      setState(() {
        errorMessage = 'Error: $e';
      });
    } finally {
      setState(() {
        isButtonClicked = false;
      });
    }
  }

  bool _isValidPhoneNumber(String phoneNumber) {
    return RegExp(r'^[0-9]+$').hasMatch(phoneNumber);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(
                height: 90,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
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
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Text(
                      "Enter phone number.",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w200,
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),
                    const SizedBox(
                      height: 100,
                    ),
                    _buildPhoneNumberInput(),
                    if (errorMessage.isNotEmpty) _buildErrorMessage(),
                    const SizedBox(
                      height: 20,
                    ),
                    _buildSendOTPButton(),
                    if (isButtonClicked) _buildPleaseWaitText(),
                    if (isButtonClicked) _buildProgressIndicator(),
                    const SizedBox(
                      height: 15,
                    ),
                    const Text(
                      "By continuing, you waive to agree to our",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.normal,
                        color: Color.fromARGB(255, 0, 0, 0),
                      ),
                    ),
                    _buildTermsAndConditionsButton(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPhoneNumberInput() {
    return Container(
      height: 55,
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            width: 10,
          ),
          SizedBox(
            width: 40,
            child: TextField(
              controller: countryController,
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly,
              ],
              decoration: const InputDecoration(
                border: InputBorder.none,
              ),
            ),
          ),
          const Text(
            "|",
            style: TextStyle(fontSize: 33, color: Colors.grey),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: TextField(
              controller: phoneNumberController,
              keyboardType: TextInputType.phone,
              maxLength: 10,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly,
              ],
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "9XXXXXXXXX",
                counterText: "",
                hintStyle: TextStyle(color: Colors.grey[400]),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSendOTPButton() {
    return SizedBox(
      width: double.infinity,
      height: 45,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: isButtonClicked
                ? [Colors.grey, Colors.grey]
                : [
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
            primary: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          onPressed: isButtonClicked ? null : _verifyPhoneNumber,
          child: const Text(
            "GET OTP",
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTermsAndConditionsButton() {
    return TextButton(
      onPressed: () {
        // Navigate to the terms and conditions page (EULA).
        // Replace 'TermsAndConditionsPage' with the actual page name.
        Navigator.push(
          context,
          CustomSlidePageRoute(page: const TermsAndConditionsPage()),
        );
      },
      child: const Text(
        "Terms and Conditions.",
        style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.normal,
          color: Color.fromARGB(255, 60, 130, 165),
          decoration: TextDecoration.underline,
        ),
      ),
    );
  }

  Widget _buildErrorMessage() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        errorMessage,
        style: TextStyle(
          fontSize: 14,
          color: Colors.red,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _buildPleaseWaitText() {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        "Please wait for the OTP code; it might take some time. If not received, make sure the entered phone number is correct and valid.",
        style: TextStyle(
          fontSize: 14,
          color: Colors.grey,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _buildProgressIndicator() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}

class TermsAndConditionsPage extends StatelessWidget {
  const TermsAndConditionsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Terms and Conditions"),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "End-User License Agreement (EULA) for D-SpamPH:\n\n",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              Text(
                "This End-User License Agreement (“Agreement”) is a legal agreement between you and AMC IT Solutions for the use of D-SpamPH, an SMS spam filtering application (“Software”).\n\n"
                "By installing, copying, or otherwise using the Software, you agree to be bound by the terms of this Agreement.\n\n"
                "1. License Grant\n"
                "   AMC IT Solutions grants you a non-exclusive, non-transferable license to use the Software on a single device.\n\n"
                "2. Compliance with Laws\n"
                "   You agree to comply with all applicable laws and regulations in connection with your use of the Software. This includes, but is not limited to, compliance with the Subscriber Identity Module (SIM) Registration Act or Republic Act No. 11934 and the Data Privacy Act of 2012 or Republic Act No. 10173 of the Philippines.\n\n"
                "3. Data Protection\n"
                "   AMC IT Solutions will process any personal data collected through your use of the Software in accordance with the Data Privacy Act of 2012 or Republic Act No. 10173 of the Philippines. AMC IT Solutions will take appropriate technical and organizational measures to protect your personal data against unauthorized or unlawful processing and against accidental loss, destruction or damage.\n\n"
                "4. Restrictions\n"
                "   You may not reverse engineer, decompile, or disassemble the Software. You may not rent, lease, or lend the Software.\n\n"
                "5. Termination\n"
                "   This Agreement will terminate automatically if you fail to comply with any of its terms and conditions. Upon termination, you must immediately cease all use of the Software and destroy all copies of the Software in your possession.\n\n"
                "6. Disclaimer of Warranties\n"
                "   The Software is provided “AS IS” without warranty of any kind. AMC IT Solutions disclaims all warranties, either express or implied, including but not limited to implied warranties of merchantability and fitness for a particular purpose.\n\n"
                "7. Limitation of Liability\n"
                "   In no event shall [Company Name] be liable for any damages whatsoever arising out of the use or inability to use the Software.\n\n"
                "8. Governing Law\n"
                "   This Agreement shall be governed by and construed in accordance with the laws of the Philippines.\n\n"
                "If you have any questions about this Agreement or if you wish to contact AMC IT Solutions for any reason, please write to Luna St. Iloilo City 5000.",
                style: TextStyle(fontSize: 15),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
