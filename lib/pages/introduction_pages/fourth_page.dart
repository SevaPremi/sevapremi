import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sevapremi/asset_paths.dart';

class FourthPage extends StatelessWidget {
  const FourthPage({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Container(
      child: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: height * 0.07),
          Stack(children: [
            Image.asset(
              Assets.carousel_4_images[0],
            ),
            Padding(
              padding: EdgeInsets.only(top: height * 0.09, left: width * 0.06),
              child: Image.asset(Assets.carousel_4_images[1]),
            ),
          ]),
          SizedBox(height: height * 0.02),
          Text(
            "Stay updated. \nJoin events & discussions\nMake an Impact",
            style: GoogleFonts.nunito(
                color: Colors.black, fontSize: 24, fontWeight: FontWeight.w700),
          )
        ],
      )),
    );
  }
}
