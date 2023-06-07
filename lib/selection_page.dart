import 'package:flutter/material.dart';
import 'package:dspamph/views/userside/login_page.dart';

class SelectionPage extends StatefulWidget {
  @override
  _SelectionPageState createState() => _SelectionPageState();
}

class _SelectionPageState extends State<SelectionPage> {
  @override
  void initState() {
    super.initState();
    // Add any initialization code here
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'images/dspamphlogo.png',
              width: 150, // Adjust the width to your desired size
              height: 150, // Adjust the height to your desired size
            ), // Replace with your logo image
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },
              child: Text('User'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Add route to admin login page
              },
              child: Text('Admin'),
            ),
          ],
        ),
      ),
    );
  }
}
