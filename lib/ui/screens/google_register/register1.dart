import 'package:bloc_custom_firebase/logic/bloc/gender_cubit/gender_cubit.dart';
import 'package:bloc_custom_firebase/logic/bloc/register/register_cubit.dart';
import "package:flutter/material.dart";
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bloc_custom_firebase/constants.dart';
import 'package:bloc_custom_firebase/logic/bloc/google_register/google_register_cubit.dart';
import 'package:bloc_custom_firebase/ui/screens/google_register/register2.dart';
import 'package:bloc_custom_firebase/ui/screens/google_register/widgets.dart';

class Reg1 extends StatefulWidget {
  @override
  _Reg1State createState() => _Reg1State();
}

class _Reg1State extends State<Reg1> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance!.removeObserver(this);
    // BlocProvider.of<GoogleRegisterCubit>(context).page = 1;
    // BlocProvider.of<GoogleRegisterCubit>(context).reset();

    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState appLifecycleState) {
    super.didChangeAppLifecycleState(appLifecycleState);

    if (appLifecycleState == AppLifecycleState.detached ||
        appLifecycleState == AppLifecycleState.paused ||
        appLifecycleState == AppLifecycleState.inactive) {
      print("ABC");
      BlocProvider.of<GoogleRegisterCubit>(context).reset();
      BlocProvider.of<GoogleRegisterCubit>(context).logout();
    }
  }

  TextEditingController name_controller = TextEditingController();
  TextEditingController number_controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<GoogleRegisterCubit, GoogleRegisterState>(
      listener: (context, state) {
        if (state is GoogleRegisterInterupt)
          Navigator.pushReplacementNamed(context, FRONT_PAGE);
      },
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  BlocProvider.of<GenderCubit>(context).reset();
                },
                icon: Icon(FontAwesomeIcons.redo)),
          ],
          backgroundColor: Colors.transparent,
          actionsIconTheme: IconThemeData(color: Colors.black),
          elevation: 0,
          centerTitle: true,
          title: Text(
            "Ecstacy",
            style: GoogleFonts.pacifico(
                fontSize: 32, fontWeight: FontWeight.w300, color: Colors.black),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(10),
          child: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
                // border: Border.all(color: Colors.black),
                ),
            child: Column(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        // border: Border.all(color: Colors.black),
                        ),
                    child: Text(
                      "Get Onboard with us!",
                      style: GoogleFonts.montserrat(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    // margin: EdgeInsets.all(20)
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        // border: Border.all(color: Colors.red),
                        ),
                    child:
                        BlocBuilder<GoogleRegisterCubit, GoogleRegisterState>(
                      builder: (context, state) {
                        int num =
                            BlocProvider.of<GoogleRegisterCubit>(context).page;
                        if (state is GoogleRegisterInitial)
                          return NameField(
                            namecontroller: name_controller,
                          );
                        else if (state is Register1Done) {
                          return NumberField(
                              numbercontroller: number_controller);
                        } else if (state is Register2Done) {}
                        return GenderSelect();
                      },
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        // border: Border.all(color: Colors.red),
                        ),
                    child:
                        BlocBuilder<GoogleRegisterCubit, GoogleRegisterState>(
                      builder: (context, state) {
                        return ProgressBar(
                          page: BlocProvider.of<GoogleRegisterCubit>(context)
                              .page,
                        );
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(40),
                    decoration: BoxDecoration(
                        // border: Border.all(color: Colors.red),
                        ),
                    child: InkWell(
                      onTap: () {
                        int num =
                            BlocProvider.of<GoogleRegisterCubit>(context).page;
                        print(num);
                        if (num == 1) {
                          if (name_controller.text != "") {
                            BlocProvider.of<GoogleRegisterCubit>(context)
                                .update_page(
                                    BlocProvider.of<GoogleRegisterCubit>(
                                            context)
                                        .page);
                            BlocProvider.of<GoogleRegisterCubit>(context)
                                .page += 1;
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text("Please Provide proper name!")));
                          }
                        } else if (num == 2) {
                          if (number_controller.text != "" &&
                              number_controller.text.length == 10) {
                            BlocProvider.of<GoogleRegisterCubit>(context)
                                .update_page(
                                    BlocProvider.of<GoogleRegisterCubit>(
                                            context)
                                        .page);
                            BlocProvider.of<GoogleRegisterCubit>(context)
                                .page += 1;
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content:
                                    Text("Please Provide proper number!")));
                          }
                        } else if (num == 3) {
                          
                        }
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(40),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Next  ",
                              style: GoogleFonts.montserrat(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Icon(FontAwesomeIcons.arrowAltCircleRight)
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class NameField extends StatelessWidget {
  TextEditingController namecontroller;
  NameField({
    Key? key,
    required this.namecontroller,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            "Enter your name",
            style: GoogleFonts.montserrat(
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: TextField(
              controller: namecontroller,
            ),
          ),
        ],
      ),
    );
  }
}

class NumberField extends StatelessWidget {
  TextEditingController numbercontroller;
  NumberField({
    Key? key,
    required this.numbercontroller,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            "Enter your Number",
            style: GoogleFonts.montserrat(
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: TextField(
              controller: numbercontroller,
            ),
          ),
        ],
      ),
    );
  }
}

class GenderSelect extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
          // border: Border.all(color: Colors.blue),
          ),
      child: Column(
        children: [
          Text(
            "Select your gender",
            style: GoogleFonts.montserrat(
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 5),
            child: BlocBuilder<GenderCubit, GenderState>(
              builder: (context, state) {
                if (state is GenderInitial) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            BlocProvider.of<GenderCubit>(context).maleSelect();
                          },
                          child: GenderCont(
                            gender: "Male",
                            icon: FontAwesomeIcons.male,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            BlocProvider.of<GenderCubit>(context)
                                .femaleSelect();
                          },
                          child: GenderCont(
                            gender: "Female",
                            icon: FontAwesomeIcons.female,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            BlocProvider.of<GenderCubit>(context).otherselect();
                          },
                          child: GenderCont(
                            gender: "Others",
                            icon: FontAwesomeIcons.flag,
                            color: Colors.black,
                          ),
                        ),
                      )
                    ],
                  );
                } else if (state is MaleSelect) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            BlocProvider.of<GenderCubit>(context).maleSelect();
                          },
                          child: GenderCont(
                            gender: "Male",
                            icon: FontAwesomeIcons.male,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            BlocProvider.of<GenderCubit>(context)
                                .femaleSelect();
                          },
                          child: GenderCont(
                            gender: "Female",
                            icon: FontAwesomeIcons.female,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            BlocProvider.of<GenderCubit>(context).otherselect();
                          },
                          child: GenderCont(
                            gender: "Others",
                            icon: FontAwesomeIcons.flag,
                            color: Colors.black,
                          ),
                        ),
                      )
                    ],
                  );
                } else if (state is FemaleSelect) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            BlocProvider.of<GenderCubit>(context).maleSelect();
                          },
                          child: GenderCont(
                            gender: "Male",
                            icon: FontAwesomeIcons.male,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            BlocProvider.of<GenderCubit>(context)
                                .femaleSelect();
                          },
                          child: GenderCont(
                            gender: "Female",
                            icon: FontAwesomeIcons.female,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            BlocProvider.of<GenderCubit>(context).otherselect();
                          },
                          child: GenderCont(
                            gender: "Others",
                            icon: FontAwesomeIcons.flag,
                            color: Colors.black,
                          ),
                        ),
                      )
                    ],
                  );
                } else if (state is OtherSelect) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            BlocProvider.of<GenderCubit>(context).maleSelect();
                          },
                          child: GenderCont(
                            gender: "Male",
                            icon: FontAwesomeIcons.male,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            BlocProvider.of<GenderCubit>(context)
                                .femaleSelect();
                          },
                          child: GenderCont(
                            gender: "Female",
                            icon: FontAwesomeIcons.female,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            BlocProvider.of<GenderCubit>(context).otherselect();
                          },
                          child: GenderCont(
                            gender: "Others",
                            icon: FontAwesomeIcons.flag,
                            color: Colors.white,
                          ),
                        ),
                      )
                    ],
                  );
                } else
                  return Container();
              },
            ),
          )
        ],
      ),
    );
  }
}

class GenderCont extends StatelessWidget {
  GenderCont({required this.gender, required this.icon, required this.color});
  IconData icon;
  String gender;
  Color color;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(4),
        decoration: BoxDecoration(
            color: color == Colors.black ? Colors.white : Colors.red[800],
            border: Border.all(color: color),
            borderRadius: BorderRadius.circular(50)),
        child: Row(
          children: [
            Icon(
              icon,
              color: color,
            ),
            Text(
              " " + gender,
              style: GoogleFonts.montserrat(
                  color: color, fontWeight: FontWeight.w400),
            )
          ],
        ),
      ),
    );
  }
}
