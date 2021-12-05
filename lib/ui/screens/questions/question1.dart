import 'package:bloc_custom_firebase/constants.dart';
import 'package:bloc_custom_firebase/logic/bloc/theme_cubit/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class Question1 extends StatefulWidget {
  const Question1({Key? key}) : super(key: key);

  @override
  _Question1State createState() => _Question1State();
}

//Question about Age
class _Question1State extends State<Question1> {
  @override
  int _value = 18;
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double heigh = MediaQuery.of(context).size.height;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          BlocProvider.of<ThemeCubit>(context).changetheme();
        },
      ),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Ecstacy",
          // style: GoogleFonts.montserrat(fontSize: 20),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Container(
            width: width,
            // decoration: BoxDecoration(border: Border.all(color: Colors.white)),
            child: Column(mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "1",
                    style: GoogleFonts.montserrat(
                        fontSize: 20, fontWeight: FontWeight.w700),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Text(
                    "how old are you ?",
                    style: GoogleFonts.montserrat(
                        fontSize: 20, fontWeight: FontWeight.w700),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  DropdownButton(
                    focusColor: Theme.of(context).brightness == Brightness.dark
                        ? Colors.white
                        : Colors.black,
                    borderRadius: BorderRadius.circular(10),
                    value: _value,
                    style: GoogleFonts.montserrat(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: Theme.of(context).brightness == Brightness.dark
                            ? Colors.white
                            : Colors.black),
                    items: [
                      DropdownMenuItem(child: Text("18"), value: 18),
                      DropdownMenuItem(child: Text("19"), value: 19),
                      DropdownMenuItem(child: Text("20"), value: 20),
                      DropdownMenuItem(child: Text("21"), value: 21),
                      DropdownMenuItem(child: Text("22"), value: 22),
                      DropdownMenuItem(child: Text("23"), value: 23),
                    ],
                    onChanged: (val) {
                      setState(() {
                        _value = val as int;
                        print(val);
                      });
                    },
                  ),
                  SizedBox(height: 50),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 10),
                    child: InkWell(
                      onTap: () {
                        Navigator.pushReplacementNamed(context, QUESTION2);
                      },
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Theme.of(context).primaryColor,
                                width: 2),
                            borderRadius: BorderRadius.circular(25)),
                        padding:
                            EdgeInsets.symmetric(horizontal: 50, vertical: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Next",
                              style: GoogleFonts.montserrat(
                                  fontSize: 18, fontWeight: FontWeight.w600),
                            ),
                            Icon(FontAwesomeIcons.signInAlt)
                          ],
                        ),
                      ),
                    ),
                  )
                ])),
      ),
    );
  }
}
