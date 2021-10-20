import 'package:bloc_custom_firebase/constants.dart';
import 'package:bloc_custom_firebase/logic/bloc/onboard/onboard_cubit.dart';
import 'package:bloc_custom_firebase/logic/bloc/theme_cubit/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class FrontPage extends StatefulWidget {
  @override
  _FrontPageState createState() => _FrontPageState();
}

class _FrontPageState extends State<FrontPage> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<OnboardCubit>(context).reload();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          BlocProvider.of<ThemeCubit>(context).changetheme(Theme.of(context));
        },
      ),
      body: Padding(
        padding: EdgeInsets.all(30),
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              Center(
                  child: Text(
                "Ecstacy",
                style: Theme.of(context).textTheme.headline1,
              )),
              SizedBox(
                height: 50,
              ),
              Center(
                child: Container(
                  // alignment: Alignment.center,
                  child: SvgPicture.asset(
                    "lib/assets/svg/img1.svg",
                    semanticsLabel: "abc",
                    height: 300,
                    width: 60,
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Center(
                  child: Text(
                "Hello!",
                style: GoogleFonts.montserrat(
                    fontSize: 23, fontWeight: FontWeight.bold),
              )),
              Center(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 40),
                  child: Container(
                    height: 130,
                    child: Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: BlocConsumer<OnboardCubit, OnboardState>(
                        listener: (context, state) {
                          if (state is OnboardHome)
                            Navigator.pushReplacementNamed(context, HOME_ROUTE);
                          else if (state is OnboardRegister)
                            Navigator.pushReplacementNamed(
                                context, REGISTER_PAGE1);
                        },
                        builder: (context, state) {
                          if (state is OnboardInitial)
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                InkWell(
                                  onTap: () {
                                    BlocProvider.of<OnboardCubit>(context)
                                        .signinwithgoogle();
                                  },
                                  child: Container(
                                    height: 70,
                                    width: 70,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                            color:
                                                Theme.of(context).primaryColor,
                                            width: 2.5)),
                                    child: Icon(
                                      FontAwesomeIcons.google,
                                      color: Theme.of(context).iconTheme.color,
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    print("CDF");
                                  },
                                  child: Container(
                                    height: 70,
                                    width: 70,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                            color:
                                                Theme.of(context).primaryColor,
                                            width: 2.5)),
                                    child: Icon(FontAwesomeIcons.phoneAlt),
                                  ),
                                )
                              ],
                            );
                          else if (state is OnboardLoad) {
                            return SpinKitCubeGrid(
                              color: Theme.of(context).primaryColor,
                            );
                          } else
                            return Container();
                        },
                      ),
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
