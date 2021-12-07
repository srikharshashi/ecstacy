import 'package:bloc_custom_firebase/constants.dart';
import 'package:bloc_custom_firebase/logic/bloc/google_register/google_register_cubit.dart';
import 'package:bloc_custom_firebase/logic/bloc/theme_cubit/theme_cubit.dart';
import 'package:bloc_custom_firebase/ui/screens/google_register/widgets.dart';
import "package:flutter/material.dart";
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class Reg8 extends StatefulWidget {
  const Reg8({Key? key}) : super(key: key);

  @override
  _Reg8State createState() => _Reg8State();
}

class _Reg8State extends State<Reg8> with WidgetsBindingObserver {
  void initState() {
    BlocProvider.of<GoogleRegisterCubit>(context).registeruser();
    super.initState();
    WidgetsBinding.instance!.addObserver(this);
  }

  int _value = 18;
  bool _activate = false;
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
    return BlocListener<GoogleRegisterCubit, GoogleRegisterState>(
      listener: (context, state) {
        if (state is GoogleRegisterInitial) {
        } else if (state is GoogleRegisterInterupt) {
          Navigator.pushReplacementNamed(context, FRONT_PAGE);
        } else if (state is UserRegistered) {
          _activate = true;
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
                    BlocBuilder<GoogleRegisterCubit, GoogleRegisterState>(
                      builder: (context, state) {
                        if (state is RegisteringUser) {
                          return Container(
                            height: (height / (2.5)) * 0.6,
                            width: width,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "you are being registered",
                                  style: GoogleFonts.montserrat(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600),
                                ),
                                LoadingAnimationWidget.dotsTriangle(
                                    color: (Theme.of(context).primaryColor),
                                    size: 30),
                              ],
                            ),
                          );
                        } else if (state is UserRegistered) {
                          return Container(
                              height: (height / (2.5)) * 0.6,
                              width: width,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "You have been registered ✔✔✔",
                                    style: GoogleFonts.montserrat(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600),
                                  )
                                ],
                              ));
                        } else {
                          return Container(
                              height: (height / (2.5)) * 0.6,
                              width: width,
                              child: Column(
                                children: [
                                  Text("Random Error"),
                                  ElevatedButton(
                                    onPressed: () {
                                      BlocProvider.of<GoogleRegisterCubit>(
                                              context)
                                          .registeruser();
                                    },
                                    child: Text("Try Again"),
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              Theme.of(context).primaryColor),
                                    ),
                                  )
                                ],
                              ));
                        }
                      },
                    ),
                    Container(
                      height: (height / (2.5)) * 0.4,
                      child: ProgressBar(
                          n: 8, page: context.read<GoogleRegisterCubit>().page),
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
                    if (_activate) {
                      update();
                      Navigator.pushReplacementNamed(context, QUESTIONS_HOME);
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
