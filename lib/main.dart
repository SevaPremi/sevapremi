import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sevapremi/asset_paths.dart';
import 'package:sevapremi/pages/splash_screens/splash_screen.dart';
import 'package:sevapremi/routes/route_management.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(),
      home: const SplashScreen(),
      initialRoute: "/tos_page",
      onGenerateRoute: RouteManagement().generateRoute,
    );
  }
}

class CommingSoonPage extends StatefulWidget {
  const CommingSoonPage({super.key});

  @override
  State<CommingSoonPage> createState() => _CommingSoonPageState();
}

class _CommingSoonPageState extends State<CommingSoonPage> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment(0.0, -1.0),
        end: Alignment(1.0, 0.0),
        colors: [
          Color(0xFFfc0464),
          Color(0xFF0744a2),
        ],
      )),
      child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(36)),
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Image.asset(Assets.logo),
                  ),
                  SizedBox(
                    height: height * 0.05,
                  ),
                  Text("Coming soon",
                      style: GoogleFonts.poppins(
                          color: Colors.grey,
                          fontSize: 24,
                          fontWeight: FontWeight.w600)),
                  SizedBox(
                    height: height * 0.05,
                  ),
                  Text(
                    "STAY TUNED FOR SOMETHING AMAZING",
                    style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontSize: 35,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.1,
                    ),
                  ),
                  Image.asset(
                      Assets.comingsoon)
                ],
              ),
            ),
          )),
    ));
  }
}
