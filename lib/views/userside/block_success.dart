// connect redirection from spam_page.dart
import 'package:flutter/material.dart';
import 'package:dspamph/views/userside/homepage.dart';

class BlockSuccessPage extends StatelessWidget {
  const BlockSuccessPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Spam and Number Blocked'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(
              backgroundColor: Colors.orange,
              radius: 60,
              child: Icon(
                Icons.check,
                size: 60,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 50),
              child: Text(
                'Spam message and number successfully blocked!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomePage(),
                  ),
                );
              },
              child: const Text('BACK TO HOMEPAGE'),
            ),
          ],
        ),
      ),
    );
  }
}
