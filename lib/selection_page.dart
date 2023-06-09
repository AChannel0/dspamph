import 'package:flutter/material.dart';
import 'package:dspamph/views/userside/login_page.dart';
import 'package:dspamph/views/adminside/login_admin.dart';

class SelectionPage extends StatefulWidget {
  const SelectionPage({super.key});

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
      body: Padding(
        padding: const EdgeInsets.only(top: 100),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              'images/dspamphlogo.png',
              width: 150,
              height: 150,
            ),
            const SizedBox(height: 5),
            const Text(
              'D-SpamPH',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 50),
            const Text(
              'Welcome, User!',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Color.fromARGB(255, 110, 110, 110),
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Please select user type.',
              style: TextStyle(
                fontSize: 16,
                color: Color.fromARGB(255, 110, 110, 110),
              ),
            ),
            const SizedBox(height: 100),
            Align(
              alignment: Alignment.center,
              child: SizedBox(
                width: 200,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginPage()),
                    );
                  },
                  child: const Text(
                    'User',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Align(
              alignment: Alignment.center,
              child: SizedBox(
                width: 200,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginAdmin()),
                    );
                  },
                  child: const Text(
                    'Admin',
                    style: TextStyle(
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
