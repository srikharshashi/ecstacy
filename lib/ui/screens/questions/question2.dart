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

class Question2 extends StatefulWidget {
  const Question2({Key? key}) : super(key: key);

  @override
  _Question2State createState() => _Question2State();
}

//Question 2  about Pets
class _Question2State extends State<Question2> {
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
                        height: (height / (2.5)) * 0.6,
                        width: width,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text("how about pets?",
                                style: GoogleFonts.montserrat(
                                    fontSize: 18, fontWeight: FontWeight.w700)),
                            GroupButton(
                              isRadio: true,
                              spacing: 10,
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
                              buttons: ["Oh pets are cool!", "Nah Im good.."],
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
                        //go set it over here
                        Navigator.pushReplacementNamed(context, QUESTION21);
                      } else if (index == 1) {
                        //just leave the pets to be null
                        Navigator.pushReplacementNamed(context, QUESTION4);
                      }
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

//   Widget build(BuildContext context) {
//     double height = MediaQuery.of(context).size.height;
//     double width = MediaQuery.of(context).size.width;
//     bool _selected = false;

//     return Scaffold(
//         floatingActionButton: FloatingActionButton(
//           onPressed: () {
//             BlocProvider.of<ThemeCubit>(context).changetheme();
//           },
//         ),
//         appBar: AppBar(
//           centerTitle: true,
//           title: Text("Ecstacy"),
//         ),
//         body: Padding(
//           padding: EdgeInsets.all(20),
//           child: Container(
//               child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Container(
//                 // decoration:
//                 //     BoxDecoration(border: Border.all(color: Colors.white)),
//                 height: height / 2.5,
//                 width: width,
//                 padding: EdgeInsets.all(10),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   children: [
//                     Text("What do you think of the idea of having pets ?",
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
//                       onSelected: (index, isSelected) {
//                         _selected = isSelected;
//                       },
//                       buttons: ["Oh pets are cool!", "Nah Im good.."],
//                     ),
//                   ],
//                 ),
//               ),
//               InkWell(
//                 onTap: () {
//                   if (_selected)
//                     Navigator.pushReplacementNamed(context, QUESTION2);
//                 },
//                 child: Container(
//                   height: height / 12,
//                   width: width / 1.8,
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Text(
//                         "Next",
//                         style: GoogleFonts.montserrat(
//                             fontSize: 20, fontWeight: FontWeight.w700),
//                       ),
//                       Icon(FontAwesomeIcons.signInAlt)
//                     ],
//                   ),
//                   decoration: BoxDecoration(
//                       border: Border.all(color: Theme.of(context).primaryColor),
//                       borderRadius: BorderRadius.circular(20)),
//                 ),
//               )
//             ],
//           )),
//         ));
//   }
// }
