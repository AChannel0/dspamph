import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dspamph/views/userside/login_page.dart';

class SelectionPage extends StatefulWidget {
  const SelectionPage({Key? key}) : super(key: key);

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
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/login.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 130),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(
                'assets/images/dspamphlogo.png',
                width: 180,
                height: 180,
              ),
              const SizedBox(height: 15),
              const Text('D-SpamPH',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 35,
                    color: Color.fromARGB(255, 255, 255, 255),
                  )),
              const SizedBox(height: 180),
              const Text(
                'Welcome, User!',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  color: CupertinoColors.white,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Please login.',
                style: TextStyle(
                  fontSize: 16,
                  color: CupertinoColors.white,
                ),
              ),
              const SizedBox(height: 50),
              Align(
                alignment: Alignment.center,
                child: SizedBox(
                  width: 180,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginPage(),
                        ),
                      );
                    },
                    child: const Text('Login',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            // color: Color.fromARGB(255, 255, 255, 255)),
                            color: CupertinoColors.white)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
