import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sevapremi/asset_paths.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  String phoneNumber = "+91 9876543210"; 
  String website = "https://sevapremi.com";
  String email = "qz6mT@example.com";
  String address = "123 Anywhere Street, City, Country";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Contact Us',
          style: GoogleFonts.manrope(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        backgroundColor: Colors.transparent,
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Positioned(bottom: 0, child: Image.asset(Assets.about_page[1])),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 100),
                  ContactDetails(text: phoneNumber, icon: Icon(Icons.phone)),
                  SizedBox(height: 10),
                  ContactDetails(text: website, icon: Icon(CupertinoIcons.globe)),
                  SizedBox(height: 10),
                  ContactDetails(text: email, icon: Icon(CupertinoIcons.mail)),
                  SizedBox(height: 10),
                  ContactDetails(text: address, icon: Icon(Icons.location_on)),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class ContactDetails extends StatelessWidget {
  final String text ;
  final Icon icon;
  const ContactDetails({required this.text, required this.icon, super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xFF1b7895),
                          ),
                          child: Icon(
                            icon.icon,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                        SizedBox(width: 10),
                        GestureDetector(
                          onLongPress: () {
                            Clipboard.setData(ClipboardData(text: text));
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Copied to clipboard'),
                                duration: Duration(milliseconds: 1000),
                              ),
                            );
                          },
                          child: Text(
                            text,
                            style: GoogleFonts.manrope(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              height: 1.9, // Adjust line spacing here
                            ),
                             // Allow overflow text to wrap
                          ),
                        ),
      ]),
    );
  }
}