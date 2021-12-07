import 'package:bloc_custom_firebase/logic/bloc/google_register/google_register_cubit.dart';
import 'package:bloc_custom_firebase/logic/bloc/question_controller/question_controller_cubit.dart';
import 'package:bloc_custom_firebase/logic/bloc/theme_cubit/theme_cubit.dart';
import 'package:bloc_custom_firebase/ui/screens/google_register/widgets.dart';
import "package:flutter/material.dart";
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:group_button/group_button.dart';

import '../../../constants.dart';

class Question6 extends StatefulWidget {
  const Question6({Key? key}) : super(key: key);

  @override
  _Question6State createState() => _Question6State();
}

//Question about choice of gender
class _Question6State extends State<Question6> {
  final formkey = GlobalKey<FormState>();

  List<String> values = ["Men", "Women", "Others"];
  bool _selected = false;

  @override
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
                height: height / 7,
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
                    Form(
                      key: formkey,
                      child: Container(
                        height: (height / (2.5)) * 0.6,
                        width: width,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text("show me :",
                                style: GoogleFonts.montserrat(
                                    fontSize: 18, fontWeight: FontWeight.w700)),
                            GroupButton(
                              spacing: 10,
                              isRadio: false,
                              direction: Axis.horizontal,
                              selectedBorderColor:
                                  Theme.of(context).primaryColor,
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
                                _selected = isSelected;
                                if (BlocProvider.of<QuestionControllerCubit>(
                                        context)
                                    .data["interest"]
                                    .contains(values[ind])) {
                                  //then remove it because its present twice
                                  BlocProvider.of<QuestionControllerCubit>(
                                          context)
                                      .data["interest"]
                                      .remove(values[ind]);
                                } else {
                                  //then just add it
                                  BlocProvider.of<QuestionControllerCubit>(
                                          context)
                                      .data["interest"]
                                      .add(values[ind]);
                                }
                              },
                              buttons: ["men", "women", "others"],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: (height / (2.5)) * 0.4,
                      child: ProgressBar(n: 6, page: 6),
                    )
                  ],
                ),
              ),
              Container(
                height: height / 8,
                width: width,
                padding: EdgeInsets.symmetric(horizontal: 60, vertical: 15),
                child: InkWell(
                  onTap: () {
                    if (_selected) {
                      if (!BlocProvider.of<QuestionControllerCubit>(context)
                          .data["interest"]
                          .isEmpty) {
                        Navigator.pushReplacementNamed(context, QUESTIONS_COMP);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text("Select one of teh option")));
                      }
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Select one of teh option")));
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
