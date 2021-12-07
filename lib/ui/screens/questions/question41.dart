import 'package:bloc_custom_firebase/logic/bloc/google_register/google_register_cubit.dart';
import 'package:bloc_custom_firebase/logic/bloc/question_controller/question_controller_cubit.dart';
import 'package:bloc_custom_firebase/logic/bloc/theme_cubit/theme_cubit.dart';
import 'package:bloc_custom_firebase/ui/screens/google_register/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:group_button/group_button.dart';

import '../../../constants.dart';

class Question41 extends StatefulWidget {
  const Question41({Key? key}) : super(key: key);

  @override
  _Question41State createState() => _Question41State();
}

class _Question41State extends State<Question41> {
  bool _selected = false;
  int index = -1;

  Map<int, String> values = {
    0: "cricket",
    1: "football",
    2: "F1",
    3: "tennis",
  };
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
                      child: Container(
                        height: (height / (2.5)) * 0.7,
                        width: width,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text("select some of these !",
                                style: GoogleFonts.montserrat(
                                    fontSize: 18, fontWeight: FontWeight.w700)),
                            Text("try and limit to 2-3",
                                style: GoogleFonts.montserrat(
                                    fontSize: 14, fontWeight: FontWeight.w400)),
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
                                    .data["sports"]
                                    .contains(values[ind])) {
                                  //then remove it because its present twice
                                  BlocProvider.of<QuestionControllerCubit>(
                                          context)
                                      .data["sports"]
                                      .remove(values[ind]);
                                } else {
                                  //then just add it
                                  BlocProvider.of<QuestionControllerCubit>(
                                          context)
                                      .data["sports"]
                                      .add(values[ind]);
                                }
                              },
                              buttons: ["crciket", "football", "F1", "tennis"],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: (height / (2.5)) * 0.4,
                      child: ProgressBar(n: 7, page: 4),
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
                      print(BlocProvider.of<QuestionControllerCubit>(context)
                          .data["sports"]);
                      Navigator.pushReplacementNamed(context, QUESTION5);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            "select something bro pls",
                          ),
                        ),
                      );
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
