import 'package:flutter/material.dart';
import 'package:dspamph/views/adminside/dashboard_page.dart';

class LoginAdmin extends StatefulWidget {
  const LoginAdmin({super.key});

  @override
  _LoginAdminState createState() => _LoginAdminState();
}

class _LoginAdminState extends State<LoginAdmin> {
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 150),
            SizedBox(
              height: 150,
              width: 150,
              child: Image.asset('assets/images/dspamphlogo.png'),
            ),
            const SizedBox(height: 10),
            const Center(
              child: Text(
                'D-SpamPH',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
            const SizedBox(height: 50),
            SizedBox(
              width: 100,
              child: TextField(
                onChanged: (value) {},
                decoration: InputDecoration(
                  labelText: 'Admin Email',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(color: Colors.grey),
                  ),
                  filled: true,
                  fillColor: Colors.grey[200],
                ),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: 100,
              child: TextField(
                onChanged: (value) {},
                decoration: InputDecoration(
                  labelText: 'Admin Password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(color: Colors.grey),
                  ),
                  filled: true,
                  fillColor: Colors.grey[200],
                ),
              ),
            ),
            // SizedBox(height: 10),
            // Align(
            //   alignment: Alignment.centerLeft,
            //   child: TextButton(
            //     onPressed: () {},
            //     child: Text(
            //       'Click here to send OTP',
            //       style: TextStyle(
            //         color: Colors.blue,
            //         fontSize: 12,
            //       ),
            //     ),
            //   ),
            // ),
            const SizedBox(height: 20),
            TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const DashboardPage()));
              },
              child: Container(
                width: 150,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: const Center(
                  child: Text(
                    'LOGIN',
                    style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
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
