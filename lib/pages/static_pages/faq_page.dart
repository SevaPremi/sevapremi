import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sevapremi/asset_paths.dart';

class FaqPage extends StatefulWidget {
  const FaqPage({super.key});

  @override
  State<FaqPage> createState() => _FaqPageState();
}

class _FaqPageState extends State<FaqPage> {
  String question = "What is Seva Premi?";
  String answer_text =
      "Seva Premi is a platform connecting donors, organizations, and communities to support various causes like education, healthcare, elderly care, and more. It enables you to contribute through monetary donations, essential items, or volunteering efforts.";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Help & FAQs',
          style: GoogleFonts.manrope(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        backgroundColor: Colors.transparent,
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Positioned(top: 0, child: Image.asset(Assets.about_page[3])),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 250),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  // height: 464,
                  // width: 464,
                  child: Text(
                    question,
                    style: GoogleFonts.manrope(
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                      height: 1.9, // Adjust line spacing here
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                child: Text(
                  answer_text,
                  style: GoogleFonts.manrope(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    height: 1.5, // Adjust line spacing here
                  )),
              )
            ],
          )
        ],
      ),
    );
  }
}
