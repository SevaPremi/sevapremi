import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sevapremi/asset_paths.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  String about_text =
      "SevaPremi is a mobile application designed to bring communities together to support and celebrate social initiatives. The app enables users to create and join impactful events, share information about causes, and connect with like-minded individuals dedicated to making a difference. Users can easily organize initiatives by selecting a cause, date, time, and location while inviting others to participate. SevaPremi provides tools for event promotion, engagement tracking, and collaboration, making it easier to drive social change. During initiatives, users can document activities, share updates, and track progress, fostering transparency and impact measurement. The app also offers educational resources, best practices, and networking opportunities for changemakers. Beyond its features, SevaPremi nurtures a strong sense of community, allowing users to inspire one another, contribute to meaningful causes, and create lasting change in society through collective action and shared responsibility.";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text('About the App',style: GoogleFonts.manrope(fontSize: 16,fontWeight: FontWeight.w600),),
        backgroundColor: Colors.transparent,
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Positioned(bottom: 0, child: Image.asset(Assets.about_page[2])),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Text(
                about_text,
                style: GoogleFonts.manrope(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  height: 1.9, // Adjust line spacing here
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
