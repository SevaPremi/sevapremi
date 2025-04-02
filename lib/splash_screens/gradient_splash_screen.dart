
import 'package:flutter/material.dart';
import 'package:sevapremi/introduction_page.dart';

class GradientSplashScreen extends StatefulWidget {
  const GradientSplashScreen({super.key});

  @override
  State<GradientSplashScreen> createState() => _GradientSplashScreenState();
}

class _GradientSplashScreenState extends State<GradientSplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _gradientAnimation;

  @override
  void initState() {
    super.initState();

    // Initialize the animation controller
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1), // Animation duration
    );

    // Define the tween for the animation (from small to large)
    _gradientAnimation =
        Tween<double>(begin: 0.2, end: 1.0).animate(CurvedAnimation(
      parent: _controller,
      curve: Interval(0.5, 1.0,
          curve: Curves.easeInOut), // Second half of the animation
    ));

    // Start the animation
    _controller.forward();

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        // Redirect to a new page after the animation is over
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) =>
                IntroductionPage(), // Replace with your target page
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
      body: AnimatedBuilder(
            animation: _gradientAnimation,
            builder: (context, child) {
              return Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topRight, // Start from top-right corner
                    end: Alignment.bottomLeft, // Spread to bottom-left corner
                    colors: [ Color(0xFF94C2FF),Color(0xFFFF26A7)], // Gradient colors
                    stops: [0.0, _gradientAnimation.value], // Animated stops
                  ),
                ),
              );
            },
          ),
    );
  }
}
