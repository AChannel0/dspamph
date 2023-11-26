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

import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:dspamph/login_page.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  late VideoPlayerController _videoController;
  late ChewieController _chewieController;

  @override
  void initState() {
    super.initState();

    _videoController =
        VideoPlayerController.asset('assets/images/load_animation.mp4');
    _chewieController = ChewieController(
      videoPlayerController: _videoController,
      aspectRatio: 9 / 16,
      autoPlay: true,
      looping: false,
      autoInitialize: true,
      showControls: false,
    );

    startLoading();
  }

  void startLoading() {
    Timer(const Duration(seconds: 8), () {
      _videoController.pause();

      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          transitionDuration: const Duration(milliseconds: 1000),
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) {
            const begin = 0.0;
            const end = 1.0;
            const curve = Curves.easeInOut;

            var curveTween = CurveTween(curve: curve);
            var opacityTween =
                Tween<double>(begin: begin, end: end).chain(curveTween);
            var scaleTween =
                Tween<double>(begin: 0.00, end: 1.0).chain(curveTween);

            var opacityAnimation = opacityTween.animate(animation);
            var scaleAnimation = scaleTween.animate(animation);

            return ScaleTransition(
              scale: scaleAnimation,
              child: FadeTransition(
                opacity: opacityAnimation,
                child: child,
              ),
            );
          },
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) {
            return const SelectionPage();
          },
        ),
      );
    });
  }

  @override
  void dispose() {
    _videoController.dispose();
    _chewieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Set the background color to white
      body: Center(
        child: Chewie(
          controller: _chewieController,
        ),
      ),
    );
  }
}
