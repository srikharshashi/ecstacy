import 'package:bloc_custom_firebase/constants.dart';
import 'package:bloc_custom_firebase/logic/bloc/theme_cubit/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:group_button/group_button.dart';

class Question31 extends StatefulWidget {
  const Question31({Key? key}) : super(key: key);

  @override
  _Question31State createState() => _Question31State();
}
//Question about Pets pt 2

class _Question31State extends State<Question31> {
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
          padding: EdgeInsets.all(20),
          child: Container(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                // decoration:
                //     BoxDecoration(border: Border.all(color: Colors.white)),
                height: height / 2.5,
                width: width,
                padding: EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text("Would you call yourself a dog person and cat person",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.montserrat(
                            fontSize: 20, fontWeight: FontWeight.w700)),
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
                      onSelected: (index, isSelected) =>
                          print('$index button is selected'),
                      buttons: ["Cat Person", "Dog Person", "Both"],
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.pushReplacementNamed(context, QUESTION4);
                },
                child: Container(
                  height: height / 12,
                  width: width / 1.8,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Next",
                        style: GoogleFonts.montserrat(
                            fontSize: 20, fontWeight: FontWeight.w700),
                      ),
                      // SizedBox(
                      //   width: 3,
                      // ),
                      Icon(FontAwesomeIcons.signInAlt)
                    ],
                  ),
                  decoration: BoxDecoration(
                      border: Border.all(color: Theme.of(context).primaryColor),
                      borderRadius: BorderRadius.circular(20)),
                ),
              )
            ],
          )),
        ));
  }
}
