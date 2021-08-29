import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProgressBar extends StatelessWidget {
  int page;
  ProgressBar({required this.page});
  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).size.height);
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 10,
            width: MediaQuery.of(context).size.width / 1.2,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    color: page >= 1 ? Colors.black : Colors.white,
                  ),
                ),
                Expanded(
                  child: Container(
                    color: page >= 2 ? Colors.black : Colors.white,
                  ),
                ),
                Expanded(
                  child: Container(
                    color: page >= 3 ? Colors.black : Colors.white,
                  ),
                ),
                Expanded(
                  child: Container(
                    color: page >= 4 ? Colors.black : Colors.white,
                  ),
                ),
                Expanded(
                  child: Container(
                    color: page >= 5 ? Colors.black : Colors.white,
                  ),
                ),
                Expanded(
                  child: Container(
                    color: page >= 6 ? Colors.black : Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Divider(),
          Text(
            "$page/6",
            style: GoogleFonts.montserrat(
                fontSize: 20, fontWeight: FontWeight.w600),
          )
        ],
      ),
    );
  }
}
