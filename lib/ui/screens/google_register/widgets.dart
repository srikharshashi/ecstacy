import 'package:bloc_custom_firebase/logic/bloc/gender_cubit/gender_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class ProgressBar extends StatelessWidget {
  int page;
  ProgressBar({required this.page});
  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).size.height);
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 10,
            width: MediaQuery.of(context).size.width / 1.2,
            decoration: BoxDecoration(
              border: Border.all(color: Theme.of(context).primaryColor),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    color: page >= 1
                        ? Theme.of(context).primaryColor
                        : Colors.white,
                  ),
                ),
                Expanded(
                  child: Container(
                    color: page >= 2
                        ? Theme.of(context).primaryColor
                        : Colors.white,
                  ),
                ),
                Expanded(
                  child: Container(
                    color: page >= 3
                        ? Theme.of(context).primaryColor
                        : Colors.white,
                  ),
                ),
                Expanded(
                  child: Container(
                    color: page >= 4
                        ? Theme.of(context).primaryColor
                        : Colors.white,
                  ),
                ),
                Expanded(
                  child: Container(
                    color: page >= 5
                        ? Theme.of(context).primaryColor
                        : Colors.white,
                  ),
                ),
                Expanded(
                  child: Container(
                    color: page >= 6
                        ? Theme.of(context).primaryColor
                        : Colors.white,
                  ),
                ),
                Expanded(
                  child: Container(
                    color: page >= 7
                        ? Theme.of(context).primaryColor
                        : Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Divider(),
          Text(
            "$page/7",
            style: GoogleFonts.montserrat(
                fontSize: 20, fontWeight: FontWeight.w600),
          )
        ],
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
            color: color == Colors.black
                ? Colors.white
                : Theme.of(context).primaryColor,
            border: Border.all(color: Theme.of(context).primaryColor),
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
