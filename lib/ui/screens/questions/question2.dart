import 'dart:ui';
import 'package:bloc_custom_firebase/constants.dart';
import 'package:bloc_custom_firebase/logic/bloc/theme_cubit/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:group_button/group_button.dart';

class Qeustion2 extends StatefulWidget {
  const Qeustion2({Key? key}) : super(key: key);

  @override
  _Qeustion2State createState() => _Qeustion2State();
}

//Question about Employment
class _Qeustion2State extends State<Qeustion2> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    bool _selected = false;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          BlocProvider.of<ThemeCubit>(context).changetheme();
        },
      ),
      appBar: AppBar(
        centerTitle: true,
        title: Text("Ecstacy"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          width: width,
          // decoration: BoxDecoration(border: Border.all(color: Colors.white)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  "how would you describle your employment status",
                  style: GoogleFonts.montserrat(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              GroupButton(
                isRadio: true,
                spacing: 10,
                direction: Axis.vertical,
                selectedBorderColor: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(20),
                unselectedColor: Theme.of(context).canvasColor,
                unselectedTextStyle: TextStyle(
                    color: Theme.of(context).brightness == Brightness.dark
                        ? Colors.white
                        : Colors.black),
                unselectedBorderColor: Theme.of(context).primaryColor,
                selectedColor: Theme.of(context).primaryColor,
                onSelected: (index, isSelected) {
                  print('$index button is selected');
                  _selected = isSelected;
                  print("$_selected outside");
                },
                buttons: [
                  "Employed",
                  "Unemployed",
                  "Student",
                  "Self-Employed",
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                child: InkWell(
                  onTap: () {
                    if (_selected)
                      Navigator.pushReplacementNamed(context, QUESTION3);
                  },
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: Theme.of(context).primaryColor, width: 2),
                        borderRadius: BorderRadius.circular(25)),
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 5),
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
            ],
          ),
        ),
      ),
    );
  }
}
