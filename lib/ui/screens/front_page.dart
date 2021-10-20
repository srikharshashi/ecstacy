import 'package:bloc_custom_firebase/constants.dart';
import 'package:bloc_custom_firebase/logic/bloc/onboard/onboard_cubit.dart';
import 'package:bloc_custom_firebase/logic/bloc/theme_cubit/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FrontPage extends StatefulWidget {
  const FrontPage({Key? key}) : super(key: key);

  @override
  _FrontPageState createState() => _FrontPageState();
}

class _FrontPageState extends State<FrontPage> {
  @override
  void initState() {
    BlocProvider.of<OnboardCubit>(context).reload();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          BlocProvider.of<ThemeCubit>(context).changetheme(Theme.of(context));
        },
      ),
      appBar: AppBar(
        centerTitle: true,
        title: Text("Ecstacy"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              padding: EdgeInsets.all(50),
              height: height / 2.0,
              // decoration:
              //     BoxDecoration(border: Border.all(color: Colors.white)),
              child: SvgPicture.asset("lib/assets/svg/img2.svg"),
            ),
            Container(
              height: height / 8,
              width: double.infinity,
              // decoration:
              //     BoxDecoration(border: Border.all(color: Colors.white)),
              child: Center(
                child: Text(
                  "Hello !!",
                  style: Theme.of(context).textTheme.subtitle2,
                ),
              ),
            ),
            Container(
              height: height / 6,
              // decoration:
              //     BoxDecoration(border: Border.all(color: Colors.white)),
              child: Center(
                child: BlocConsumer<OnboardCubit, OnboardState>(
                  builder: (context, state) {
                    if (state is OnboardInitial) {
                      return Container(
                        decoration: BoxDecoration(
                            // border: Border.all(color: Colors.white),
                            ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
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
                                    border: Border.all(
                                        color: Theme.of(context).primaryColor,
                                        width: 2.5),
                                    shape: BoxShape.circle),
                                child: Icon(FontAwesomeIcons.google),
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            InkWell(
                              onTap: () {
                                print("CLicked on Phone");
                              },
                              child: Container(
                                height: 70,
                                width: 70,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Theme.of(context).primaryColor,
                                        width: 2.5),
                                    shape: BoxShape.circle),
                                child: Icon(FontAwesomeIcons.phoneAlt),
                              ),
                            )
                          ],
                        ),
                      );
                    } else if (state is OnboardLoad) {
                      return SpinKitDoubleBounce(
                        color: Theme.of(context).primaryColor,
                      );
                    } else if (state is OnboardError) {
                      return Container(
                        child: Text("There was an error"),
                      );
                    } else
                      return Container();
                  },
                  listener: (context, state) {
                    if (state is OnboardHome)
                      Navigator.pushReplacementNamed(context, HOME_ROUTE);
                    else if (state is OnboardRegister)
                      Navigator.pushReplacementNamed(context, REGISTER_PAGE1);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
