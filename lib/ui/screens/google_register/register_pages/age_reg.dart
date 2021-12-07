import 'package:bloc_custom_firebase/constants.dart';
import 'package:bloc_custom_firebase/logic/bloc/google_register/google_register_cubit.dart';
import 'package:bloc_custom_firebase/logic/bloc/theme_cubit/theme_cubit.dart';
import 'package:bloc_custom_firebase/ui/screens/google_register/widgets.dart';
import "package:flutter/material.dart";
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class Reg5 extends StatefulWidget {
  const Reg5({Key? key}) : super(key: key);

  @override
  _Reg5State createState() => _Reg5State();
}

class _Reg5State extends State<Reg5> with WidgetsBindingObserver {
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addObserver(this);
  }

  int _value = 18;
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
                    Container(
                      height: (height / (2.5)) * 0.6,
                      width: width,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "how old are you ?",
                            style: GoogleFonts.montserrat(
                                fontSize: 20, fontWeight: FontWeight.w700),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          DropdownButton(
                            focusColor:
                                Theme.of(context).brightness == Brightness.dark
                                    ? Colors.white
                                    : Colors.black,
                            borderRadius: BorderRadius.circular(10),
                            value: _value,
                            style: GoogleFonts.montserrat(
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                                color: Theme.of(context).brightness ==
                                        Brightness.dark
                                    ? Colors.white
                                    : Colors.black),
                            items: [
                              DropdownMenuItem(child: Text("18"), value: 18),
                              DropdownMenuItem(child: Text("19"), value: 19),
                              DropdownMenuItem(child: Text("20"), value: 20),
                              DropdownMenuItem(child: Text("21"), value: 21),
                              DropdownMenuItem(child: Text("22"), value: 22),
                              DropdownMenuItem(child: Text("23"), value: 23),
                            ],
                            onChanged: (val) {
                              setState(() {
                                _value = val as int;
                                print(val);
                              });
                              context.read<GoogleRegisterCubit>().user_data["age"] =
                                  val;
                            },
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: (height / (2.5)) * 0.4,
                      child: ProgressBar(
                        n:8,
                          page: context.read<GoogleRegisterCubit>().page),
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
                    update();
                    Navigator.pushReplacementNamed(context, REGISTER_PAGE6);
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
