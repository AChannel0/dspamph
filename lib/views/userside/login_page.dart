import 'package:flutter/material.dart';
// import 'package:dspamph/views/userside/permission_popup.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // String number = '';
  // String otp = '';

  @override
  void initState() {
    super.initState();
    // Add any initialization code here
  }

  // void sendOTP() {
  //   // Implement your logic to send OTP to the user's number
  // }

  // void login() {
  //   // Implement your login logic here
  //   bool loggedIn = true; // Replace with your login logic
  //   if (loggedIn) {
  //     showDialog(
  //       context: context,
  //       builder: (context) => PermissionPopup(),
  //     );
  //   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 100),
            Container(
              height: 100,
              width: 100,
              child: Image.asset('images/dspamphlogo.png'),
            ),
            SizedBox(height: 10),
            Center(
              child: Text(
                'D-SpamPH',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
            SizedBox(height: 100),
            SizedBox(
              width: 100,
              child: TextField(
                onChanged: (value) {},
                decoration: InputDecoration(
                  labelText: 'Number',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  filled: true,
                  fillColor: Colors.grey[200],
                ),
              ),
            ),
            SizedBox(height: 20),
            SizedBox(
              width: 100,
              child: TextField(
                onChanged: (value) {},
                decoration: InputDecoration(
                  labelText: 'One-Time-Pin (OTP)',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  filled: true,
                  fillColor: Colors.grey[200],
                ),
              ),
            ),
            SizedBox(height: 10),
            Align(
              alignment: Alignment.centerLeft,
              child: TextButton(
                onPressed: () {},
                child: Text(
                  'Click here to send OTP',
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 12,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            TextButton(
              onPressed: () {},
              child: Container(
                width: 150,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Center(
                  child: Text(
                    'LOGIN',
                    style: TextStyle(
                      color: const Color.fromARGB(255, 0, 0, 0),
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
