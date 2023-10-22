// import 'package:flutter/material.dart';

// class LoadingScreen extends StatefulWidget {
//   const LoadingScreen({super.key});

//   @override
//   _LoadingScreenState createState() => _LoadingScreenState();
// }

// class _LoadingScreenState extends State<LoadingScreen> {
//   @override
//   void initState() {
//     super.initState();
//     // initialization
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Image.asset('assets/images/dspamphlogo.png'),
//     );
//   }
// }

// import 'package:flutter/material.dart';

// class LoadingScreen extends StatefulWidget {
//   @override
//   _LoadingScreenState createState() => _LoadingScreenState();
// }

// class _LoadingScreenState extends State<LoadingScreen> {
//   @override
//   void initState() {
//     super.initState();
//     // You can perform any initialization tasks here, such as loading data or making API calls.
//     // You can also use a Timer to simulate loading for a certain duration.
//     // Once the loading is complete, you can navigate to the next screen.
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Loading Screen'),
//       ),
//       body: const Center(
//         child:
//             CircularProgressIndicator(), // Display a circular progress indicator.
//       ),
//     );
//   }
// }

// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:dspamph/selection_page.dart'; // Import the next screen you want to navigate to

// class LoadingScreen extends StatefulWidget {
//   @override
//   _LoadingScreenState createState() => _LoadingScreenState();
// }

// class _LoadingScreenState extends State<LoadingScreen> {
//   @override
//   void initState() {
//     super.initState();
//     startLoading(); // Start the loading process
//   }

//   void startLoading() {
//     // Simulate loading duration using a Timer
//     Timer(const Duration(seconds: 3), () {
//       // Replace 3 with the desired loading duration in seconds

//       // Navigate to the next screen after the loading duration
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(
//           builder: (context) =>
//               const SelectionPage(), // Replace NextScreen() with the actual next screen widget
//         ),
//       );
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor:
//           Colors.white, // Set the background color of the screen to white
//       body: Center(
//         child: Container(
//           width: 200,
//           height: 200,
//           color: Colors
//               .white, // Set the background color of the container to white
//           child: Image.asset('assets/images/dspamphlogo.png'),
//         ),
//       ),
//     );
//   }
// }

import 'dart:async';
// import 'package:dspamph/views/userside/homepage.dart';
import 'package:flutter/material.dart';
import 'package:dspamph/login_page.dart'; // Import the next screen you want to navigate to

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    startLoading(); // Start the loading process
  }

  void startLoading() {
    // Simulate loading duration using a Timer
    Timer(const Duration(seconds: 3), () {
      // Replace 3 with the desired loading duration in seconds

      // Navigate to the next screen with a fade transition
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          transitionDuration: const Duration(
              milliseconds: 800), // Set the duration of the transition
          transitionsBuilder: (BuildContext context,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
              Widget child) {
            return FadeTransition(
              opacity:
                  animation, // Use the animation value for the opacity of the screen
              child: child,
            );
          },
          pageBuilder: (BuildContext context, Animation<double> animation,
              Animation<double> secondaryAnimation) {
            return const SelectionPage(); // Replace NextScreen() with the actual next screen widget
          },
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors
            .white, // Set the background color of the loading screen to white
        child: Center(
          child: Image.asset(
            'assets/images/dspamphlogo.png', // Replace with your PNG image path
            width: 200, // Set the desired width
            height: 200, // Set the desired height
          ),
        ),
      ),
    );
  }
}
