import 'package:bloc_custom_firebase/constants.dart';
import 'package:bloc_custom_firebase/logic/bloc/theme_cubit/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:group_button/group_button.dart';

class Question4 extends StatefulWidget {
  const Question4({Key? key}) : super(key: key);

  @override
  _Question4State createState() => _Question4State();
}

//
class _Question4State extends State<Question4> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
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
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                padding: EdgeInsets.all(30),
                height: height / 3,
                width: width,
                child: Column(
                  children: [
                    Text(
                      "How about sports tho?!",
                      style: GoogleFonts.montserrat(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: GroupButton(
                        isRadio: true,
                        spacing: 10,
                        direction: Axis.vertical,
                        selectedBorderColor: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(20),
                        unselectedColor: Theme.of(context).canvasColor,
                        unselectedTextStyle: TextStyle(
                            color:
                                Theme.of(context).brightness == Brightness.dark
                                    ? Colors.white
                                    : Colors.black),
                        unselectedBorderColor: Theme.of(context).primaryColor,
                        selectedColor: Theme.of(context).primaryColor,
                        onSelected: (index, isSelected) =>
                            print('$index button is selected'),
                        buttons: ["oh I'm into it ig", "Meh no"],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: InkWell(
                onTap: () {
                  Navigator.pushReplacementNamed(context, QUESTION41);
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(color: Theme.of(context).primaryColor),
                  ),
                  height: height / 8,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Next",
                        style: GoogleFonts.montserrat(
                            fontSize: 20, fontWeight: FontWeight.w700),
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
    );
  }
}
