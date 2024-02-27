// loading_screen.dart
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:dspamph/main_login_page.dart';

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
      backgroundColor: Colors.white,
      body: Center(
        child: Chewie(
          controller: _chewieController,
        ),
      ),
    );
  }
}
