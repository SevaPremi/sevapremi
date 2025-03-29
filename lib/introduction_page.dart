import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sevapremi/introduction_pages/first_page.dart';
import 'package:sevapremi/introduction_pages/fourth_page.dart';
import 'package:sevapremi/introduction_pages/second_page.dart';
import 'package:sevapremi/introduction_pages/third_page.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class IntroductionPage extends StatefulWidget {
  const IntroductionPage({super.key});

  @override
  State<IntroductionPage> createState() => _IntroductionPageState();
}

class _IntroductionPageState extends State<IntroductionPage> with SingleTickerProviderStateMixin {
  PageController page_controller = PageController();
  bool on_last_page = false;
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    // Initialize the animation controller
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );

    // Define the tween for the animation
    _animation = Tween<double>(begin: 10.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );

    // Start the animation
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      PageView(
        controller: page_controller,
        scrollDirection: Axis.horizontal,
        onPageChanged: (index) {
          setState(() {
            on_last_page = (index == 3);
          });
        },
        children: [
          FirstPage(),
          SecondPage(),
          ThirdPage(),
          FourthPage(),
        ],
      ),
      //Page Postion Indicator
      Container(
        alignment: Alignment(0, 0.65),
        child: SmoothPageIndicator(
          controller: page_controller,
          count: 4,
          effect: WormEffect(
            dotColor: Colors.grey,
            activeDotColor: Colors.black,
            spacing: 5,
          ),
        ),
      ),
      on_last_page
          ? Align(
              alignment: Alignment(0, 0.83),
              child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      fixedSize: Size(320, 44),
                      backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  child: Text(
                    "Get Started",
                    style: GoogleFonts.inter(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w700),
                  )),
            )
          : BottomBar(page_controller: page_controller, animation: _animation, controller: _controller,)
    ]));
  }
}


class BottomBar extends StatefulWidget {
  final PageController page_controller;
  late AnimationController controller;
  late Animation<double> animation;

  BottomBar({required this.page_controller,required this.animation,required this.controller, Key? key}) : super(key: key);

  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> with SingleTickerProviderStateMixin {

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        // Animated circle
        AnimatedBuilder(
          animation: widget.animation,
          builder: (context, child) {
            return Positioned(
              right: -50 * widget.animation.value,
              bottom: -90 * widget.animation.value,
              child: Container(
                alignment: Alignment(0.9, 0.9),
                width: 228 * widget.animation.value, // Diameter of the circle
                height: 228 * widget.animation.value, // Diameter of the circle
                decoration: BoxDecoration(
                  shape: BoxShape.circle, // Makes the container circular
                  color: Colors.grey[400], // Background color of the circle
                ),
              ),
            );
          },
        ),

        // The next arrow button
        Align(
          alignment: Alignment.bottomRight,
          child: Padding(
            padding: const EdgeInsets.only(right: 35, bottom: 20),
            child: IconButton(
              iconSize: 50,
              onPressed: () {
                widget.page_controller.nextPage(
                  duration: Duration(milliseconds: 500),
                  curve: Curves.easeIn,
                );
              },
              icon: Icon(Icons.arrow_forward_outlined),
            ),
          ),
        ),

        // The Skip Button
        Align(
          alignment: Alignment.bottomLeft,
          child: Padding(
            padding: const EdgeInsets.only(left: 40, bottom: 50),
            child: GestureDetector(
              onTap: () {
                widget.page_controller.jumpToPage(3);
              },
              child: Text(
                "Skip",
                style: GoogleFonts.nunito(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  decoration: TextDecoration.underline,
                  decorationThickness: 2,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}