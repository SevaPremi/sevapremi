import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sevapremi/asset_paths.dart';

class TosPage extends StatefulWidget {
  const TosPage({super.key});

  @override
  State<TosPage> createState() => _TosPageState();
}

class _TosPageState extends State<TosPage> {
  String about_text =
      "1. Introduction Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam vel lectus non quam sodales consequat. Aliquam erat volutpat. Curabitur eget lorem et turpis malesuada fermentum. Donec euismod ligula sed mi interdum, eget convallis purus aliquam. \n2. User Responsibilities Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse potenti. Aenean auctor erat non velit congue, ut malesuada elit aliquet. Integer efficitur, urna sed tincidunt tincidunt, ligula erat pulvinar nisi, in interdum massa magna et augue. Nulla facilisi. 3. Account Management Praesent lacinia, mauris nec dapibus tristique, ligula eros dictum justo, sed euismod lectus ex vel velit. Ut in nisl felis. Fusce at magna eu lectus facilisis dapibus. Duis et urna sit amet eros commodo fermentum. Aenean eget turpis non nisi efficitur consectetur. 4. Intellectual Property Nullam vehicula, augue in ultricies tincidunt, purus lacus";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Terms of Service',
          style: GoogleFonts.manrope(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        backgroundColor: Colors.transparent,
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Positioned(bottom: 0, child: Image.asset(Assets.about_page[0])),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
            child: SingleChildScrollView(
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Text(
                  about_text,
                  style: GoogleFonts.manrope(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    height: 1.9, // Adjust line spacing here
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
