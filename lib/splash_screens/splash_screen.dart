import 'package:flutter/material.dart';
import 'package:sevapremi/asset_paths.dart';
import 'package:sevapremi/splash_screens/gradient_splash_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _logo_animation;

  @override
  void initState() {
    super.initState();

    // Initialize the animation controller
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1), // Animation duration
    );

    // Define the tween for the animation (from small to large)
    _logo_animation = Tween<double>(begin: 0.1, end: 1.5).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut, // Smooth animation curve
      ),
    );

    // Start the animation
    _controller.forward();

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        // Redirect to a new page after the animation is over
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => GradientSplashScreen(), // Replace with your target page
          ),
        );
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose(); // Dispose the controller
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        // Use AnimatedBuilder to rebuild the logo with the animation value
        child: AnimatedBuilder(
          animation: _logo_animation,
          builder: (context, child) {
            return Transform.scale(
              scale: _logo_animation
                  .value, // Scale the logo based on animation value
              child: Image.asset(
                Assets.logo,
                width: 200,
                height: 200,
              ),
            );
          },
        ),
      ),
    );
  }
}
