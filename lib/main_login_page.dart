// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:dspamph/views/userside/login_page.dart';

// class SelectionPage extends StatefulWidget {
//   const SelectionPage({Key? key}) : super(key: key);

//   @override
//   _SelectionPageState createState() => _SelectionPageState();
// }

// class _SelectionPageState extends State<SelectionPage> {
//   @override
//   void initState() {
//     super.initState();
//     // Add any initialization code here
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         decoration: const BoxDecoration(
//           image: DecorationImage(
//             image: AssetImage('assets/images/login.png'),
//             fit: BoxFit.cover,
//           ),
//         ),
//         child: Padding(
//           padding: const EdgeInsets.only(top: 130),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               Image.asset(
//                 'assets/images/dspamphlogo.png',
//                 width: 180,
//                 height: 180,
//               ),
//               const SizedBox(height: 15),
//               const Text('D-SpamPH',
//                   style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                     fontSize: 35,
//                     color: Color.fromARGB(255, 255, 255, 255),
//                   )),
//               const SizedBox(height: 180),
//               const Text(
//                 'Welcome, User!',
//                 style: TextStyle(
//                   fontWeight: FontWeight.bold,
//                   fontSize: 25,
//                   color: CupertinoColors.white,
//                 ),
//               ),
//               const SizedBox(height: 10),
//               const Text(
//                 'Please login.',
//                 style: TextStyle(
//                   fontSize: 16,
//                   color: CupertinoColors.white,
//                 ),
//               ),
//               const SizedBox(height: 50),
//               Align(
//                 alignment: Alignment.center,
//                 child: SizedBox(
//                   width: 180,
//                   height: 50,
//                   child: ElevatedButton(
//                     onPressed: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => const LoginPage(),
//                         ),
//                       );
//                     },
//                     child: const Text('Login',
//                         style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                             fontSize: 20,
//                             // color: Color.fromARGB(255, 255, 255, 255)),
//                             color: CupertinoColors.white)),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

/////////////////////////////////////////////
/// From Allady
/// main_login_page.dart
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dspamph/views/userside/login_page.dart';

class CustomPageRoute extends PageRouteBuilder {
  final Widget page;

  CustomPageRoute({required this.page})
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

class SelectionPage extends StatelessWidget {
  const SelectionPage({Key? key}) : super(key: key);

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
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 130, 20, 170),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(
                  'assets/images/dspamphlogo.png',
                  width: 180,
                  height: 180,
                ),
                const SizedBox(height: 15),
                const Text(
                  'D-SpamPH',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 35,
                    color: Color.fromARGB(255, 255, 255, 255),
                  ),
                ),
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
                  'Get started by logging in.',
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
                      style: ElevatedButton.styleFrom(
                        primary: Colors.transparent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        elevation: 0,
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          CustomPageRoute(page: const LoginPage()),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color.fromARGB(255, 255, 123, 0),
                              Color.fromARGB(255, 255, 186, 11)
                            ], // Orange and yellow gradient
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Center(
                          child: const Text(
                            'LOGIN',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: CupertinoColors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 50),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
