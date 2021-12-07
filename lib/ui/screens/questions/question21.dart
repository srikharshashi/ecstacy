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

class Question21 extends StatefulWidget {
  const Question21({Key? key}) : super(key: key);

  @override
  _Question21State createState() => _Question21State();
}
//Question about Pets pt 2

class _Question21State extends State<Question21> {
  bool _selected = false;
  int index = -1;
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
                            Text(
                                "Would you call yourself a dog person and cat person",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.montserrat(
                                    fontSize: 18, fontWeight: FontWeight.w700)),
                            GroupButton(
                              isRadio: true,
                              spacing: 08,
                              direction: Axis.vertical,
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
                                index = ind;
                              },
                              buttons: ["Cat Person", "Dog Person", "Both"],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: (height / (2.5)) * 0.4,
                      child: ProgressBar(n: 6, page: 2),
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
                      if (index == 0) {
                        //cat
                        BlocProvider.of<QuestionControllerCubit>(context)
                            .data["pets"]
                            .add("cat");
                      } else if (index == 1) {
                        //dog
                        BlocProvider.of<QuestionControllerCubit>(context)
                            .data["pets"]
                            .add("dog");
                      } else if (index == 2) {
                        //both
                        BlocProvider.of<QuestionControllerCubit>(context)
                            .data["pets"]
                            .add("cat");
                        BlocProvider.of<QuestionControllerCubit>(context)
                            .data["pets"]
                            .add("dog");
                      }
                      Navigator.pushReplacementNamed(context, QUESTION3);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(
                              "like select something bro its not that hard")));
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


// children: [
//                     Text("Would you call yourself a dog person and cat person",
//                         textAlign: TextAlign.center,
//                         style: GoogleFonts.montserrat(
//                             fontSize: 20, fontWeight: FontWeight.w700)),
//                     GroupButton(
//                       isRadio: true,
//                       spacing: 10,
//                       direction: Axis.vertical,
//                       selectedBorderColor: Theme.of(context).primaryColor,
//                       borderRadius: BorderRadius.circular(20),
//                       unselectedColor: Theme.of(context).canvasColor,
//                       unselectedTextStyle: TextStyle(
//                           color: Theme.of(context).brightness == Brightness.dark
//                               ? Colors.white
//                               : Colors.black),
//                       unselectedBorderColor: Theme.of(context).primaryColor,
//                       selectedColor: Theme.of(context).primaryColor,
//                       onSelected: (index, isSelected) =>
//                           print('$index button is selected'),
//                       buttons: ["Cat Person", "Dog Person", "Both"],
//                     ),
//                   ],