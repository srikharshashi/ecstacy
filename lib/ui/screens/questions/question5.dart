import 'dart:ui';
import 'package:bloc_custom_firebase/constants.dart';
import 'package:bloc_custom_firebase/logic/bloc/google_register/google_register_cubit.dart';
import 'package:bloc_custom_firebase/logic/bloc/question_controller/question_controller_cubit.dart';
import 'package:bloc_custom_firebase/logic/bloc/theme_cubit/theme_cubit.dart';
import 'package:bloc_custom_firebase/ui/screens/google_register/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:group_button/group_button.dart';

class Question5 extends StatefulWidget {
  const Question5({Key? key}) : super(key: key);

  @override
  _Question5State createState() => _Question5State();
}

//Question 5 about Employment
class _Question5State extends State<Question5> {
  List<String> options = [
    "Employed",
    "Unemployed",
    "Student",
    "Self-Employed",
  ];
  bool _isselected = false;
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return BlocListener<GoogleRegisterCubit, GoogleRegisterState>(
      listener: (context, state) {
        if (state is GoogleRegisterInitial) {
        } else if (state is GoogleRegisterInterupt) {
          Navigator.pushReplacementNamed(context, FRONT_PAGE);
        }
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            BlocProvider.of<ThemeCubit>(context).changetheme();
          },
        ),
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {
                BlocProvider.of<GoogleRegisterCubit>(context).logout();
              },
              icon: Icon(FontAwesomeIcons.powerOff),
            )
          ],
          centerTitle: true,
          title: Text("Ecstacy"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: height / 10,
                width: width,
                child: Center(
                    child: Text(
                  "get onboard with us",
                  style: GoogleFonts.montserrat(
                      fontSize: 20, fontWeight: FontWeight.w700),
                )),
              ),
              Container(
                height: height / 2,
                width: width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      height: (height / (2.5)) * 0.9,
                      width: width,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                          GroupButton(
                            isRadio: true,
                            spacing: 10,
                            direction: Axis.vertical,
                            selectedBorderColor: Theme.of(context).primaryColor,
                            borderRadius: BorderRadius.circular(20),
                            unselectedColor: Theme.of(context).canvasColor,
                            unselectedTextStyle: TextStyle(
                                color: Theme.of(context).brightness ==
                                        Brightness.dark
                                    ? Colors.white
                                    : Colors.black),
                            unselectedBorderColor:
                                Theme.of(context).primaryColor,
                            selectedColor: Theme.of(context).primaryColor,
                            onSelected: (ind, isSelected) {
                              print("Click");
                              _isselected = isSelected;
                              BlocProvider.of<QuestionControllerCubit>(context)
                                  .data["employment"] = options[ind];
                            },
                            buttons: options,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: (height / (2.5)) * 0.3,
                      child: ProgressBar(n: 6, page: 5),
                    )
                  ],
                ),
              ),
              Container(
                height: height / 9,
                width: width,
                padding: EdgeInsets.symmetric(horizontal: 60, vertical: 15),
                child: InkWell(
                  onTap: () {
                    if (_isselected) {
                      if (!BlocProvider.of<QuestionControllerCubit>(context)
                          .data["employment"]
                          .isEmpty) {
                        Navigator.pushReplacementNamed(context, QUESTION6);
                      }
                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        border:
                            Border.all(color: Theme.of(context).primaryColor),
                        borderRadius: BorderRadius.circular(25)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Next   ",
                          style: GoogleFonts.montserrat(
                              fontSize: 20, fontWeight: FontWeight.w700),
                        ),
                        Icon(FontAwesomeIcons.signInAlt)
                      ],
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

// Center(
//                 child: Text(
//                   "how would you describle your employment status",
//                   style: GoogleFonts.montserrat(
//                     fontSize: 18,
//                     fontWeight: FontWeight.w600,
//                   ),
//                   textAlign: TextAlign.center,
//                 ),
//               ),
//               SizedBox(
//                 height: 30,
//               ),
//               GroupButton(
//                 isRadio: true,
//                 spacing: 10,
//                 direction: Axis.vertical,
//                 selectedBorderColor: Theme.of(context).primaryColor,
//                 borderRadius: BorderRadius.circular(20),
//                 unselectedColor: Theme.of(context).canvasColor,
//                 unselectedTextStyle: TextStyle(
//                     color: Theme.of(context).brightness == Brightness.dark
//                         ? Colors.white
//                         : Colors.black),
//                 unselectedBorderColor: Theme.of(context).primaryColor,
//                 selectedColor: Theme.of(context).primaryColor,
//                 onSelected: (index, isSelected) {
//                   print('$index button is selected');
//                   _selected = isSelected;
//                   print("$_selected outside");
//                 },
//                 buttons: [
//                   "Employed",
//                   "Unemployed",
//                   "Student",
//                   "Self-Employed",
//                 ],
//               ),
