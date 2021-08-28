import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class Progressbar extends StatelessWidget {
  int page;
  Progressbar({
    required this.page,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 70, 10, 0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 10,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            Expanded(
                child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                color: page == 1 ? Colors.black : Colors.white,
              ),
            )),
            Expanded(
                child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                color: page == 2 ? Colors.black : Colors.white,
              ),
            )),
            Expanded(
                child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                color: page == 3 ? Colors.black : Colors.white,
              ),
            )),
            Expanded(
                child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                color: page == 4 ? Colors.black : Colors.white,
              ),
            ))
          ],
        ),
      ),
    );
  }
}

class GenderSelector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        height: MediaQuery.of(context).size.height / 6,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            // border: Border.all(color: Colors.black),
            ),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            "Select Your Gender",
            style: GoogleFonts.montserrat(
                fontSize: 18, fontWeight: FontWeight.w600),
          ),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Row(children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    width: 90,
                    height: 35,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(50)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 2.0, horizontal: 2),
                      child: Center(
                        child: Row(
                          children: [
                            Icon(FontAwesomeIcons.male),
                            SizedBox(
                              width: 3,
                            ),
                            Text(
                              "Male",
                              style: GoogleFonts.montserrat(
                                  fontSize: 15, fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Spacer(
                  flex: 1,
                ),
                Progressbar(page: 2),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 30),
                    child: InkWell(
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                ),
              ]))
        ]),
      ),
    );
  }
}

class RAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      title: Text(
        "Ecstacy",
        style: GoogleFonts.pacifico(
            fontSize: 32, fontWeight: FontWeight.w300, color: Colors.black),
      ),
    );
  }
}
