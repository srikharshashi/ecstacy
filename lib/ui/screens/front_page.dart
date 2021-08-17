import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class FrontPage extends StatefulWidget {
  @override
  _FrontPageState createState() => _FrontPageState();
}

class _FrontPageState extends State<FrontPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(30),
        child: Center(
          child: ListView(
            children: [
              SizedBox(
                height: 30,
              ),
              Center(
                  child: Text(
                "Ecstacy",
                style: GoogleFonts.pacifico(
                  fontSize: 35,
                  fontWeight: FontWeight.w300,
                ),
              )),
              SizedBox(
                height: 50,
              ),
              Center(
                child: Container(
                  // alignment: Alignment.center,
                  child: SvgPicture.asset(
                    "lib/assets/svg/img1.svg",
                    semanticsLabel: "abc",
                    height: 300,
                    width: 60,
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Center(
                  child: Text(
                "Hello!",
                style: GoogleFonts.montserrat(
                    fontSize: 23, fontWeight: FontWeight.bold),
              )),
              Center(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 40),
                  child: Container(
                    height: 130,
                    // decoration: BoxDecoration(
                    //   border: Border.all(
                    //     color: Colors.black,
                    //   ),
                    // ),
                    child: Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          InkWell(
                            onTap: () {
                              print("ABC");
                            },
                            child: Container(
                              height: 70,
                              width: 70,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      color: Colors.black, width: 2.5)),
                              child: Icon(FontAwesomeIcons.google),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              print("CDF");
                            },
                            child: Container(
                              height: 70,
                              width: 70,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      color: Colors.black, width: 2.5)),
                              child: Icon(FontAwesomeIcons.phoneAlt),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
