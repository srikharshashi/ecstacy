import 'package:bloc_custom_firebase/constants.dart';
import 'package:bloc_custom_firebase/logic/bloc/google_register/google_register_cubit.dart';
import 'package:bloc_custom_firebase/logic/bloc/theme_cubit/theme_cubit.dart';
import "package:flutter/material.dart";
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:group_button/group_button.dart';

import '../widgets.dart';

class Reg2 extends StatefulWidget {
  const Reg2({Key? key}) : super(key: key);

  @override
  _Reg2State createState() => _Reg2State();
}

class _Reg2State extends State<Reg2> with WidgetsBindingObserver {
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance!.removeObserver(this);
    super.dispose();
  }

  void update() {
    print(context.read<GoogleRegisterCubit>().page);
    (context).read<GoogleRegisterCubit>().page += 1;
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState appLifecycleState) {
    super.didChangeAppLifecycleState(appLifecycleState);

    if (appLifecycleState == AppLifecycleState.detached ||
        appLifecycleState == AppLifecycleState.paused ||
        appLifecycleState == AppLifecycleState.inactive) {
      if (BlocProvider.of<GoogleRegisterCubit>(context).page != 5) {
        if (BlocProvider.of<GoogleRegisterCubit>(context).page != 6) {
          if (BlocProvider.of<GoogleRegisterCubit>(context).page != 0) {
            BlocProvider.of<GoogleRegisterCubit>(context).reset();
            BlocProvider.of<GoogleRegisterCubit>(context).logout();
          }
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    bool _selected = false;
    return BlocListener<GoogleRegisterCubit, GoogleRegisterState>(
      listener: (context, state) {
        if (state is GoogleRegisterInitial) {
        } else if (state is GoogleRegisterInterupt) {
          Navigator.pushReplacementNamed(context, FRONT_PAGE);
        }
      },
      child: Scaffold(
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
                context.read<GoogleRegisterCubit>().page = 1;
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
                      Container(
                          height: (height / (2.5)) * 0.6,
                          width: width,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text("select your identity!",
                                  style: GoogleFonts.montserrat(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700)),
                              GroupButton(
                                isRadio: true,
                                spacing: 20,
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
                                onSelected: (index, isSelected) {
                                  _selected = true;
                                  if (index == 0) {
                                    // ignore: unnecessary_statements
                                    context
                                        .read<GoogleRegisterCubit>()
                                        .user_data["gender"] = "M";
                                  } else if (index == 1) {
                                    context
                                        .read<GoogleRegisterCubit>()
                                        .user_data["gender"] = "F";
                                  } else if (index == 2) {
                                    context
                                        .read<GoogleRegisterCubit>()
                                        .user_data["gender"] = "O";
                                  }
                                  // print("$_selected outside");
                                },
                                buttons: [
                                  "Male ♂️",
                                  "Female ♀",
                                  "Other 🏳️‍🌈"
                                ],
                              ),
                            ],
                          )),
                      Container(
                          height: (height / (2.5)) * 0.4,
                          // decoration: BoxDecoration(
                          //     border: Border.all(color: Colors.red)),
                          child: ProgressBar(
                            n:8,
                              page: context.read<GoogleRegisterCubit>().page)),
                    ]),
              ),
              Container(
                // decoration:
                //     BoxDecoration(border: Border.all(color: Colors.white)),
                height: height / 8,
                width: width,
                padding: EdgeInsets.symmetric(horizontal: 60, vertical: 15),
                child: InkWell(
                  onTap: () {
                    if (_selected) {
                      update();
                      Navigator.pushReplacementNamed(context, REGISTER_PAGE3);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("select an option")));
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
