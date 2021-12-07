import 'package:bloc_custom_firebase/constants.dart';
import 'package:bloc_custom_firebase/logic/bloc/google_register/google_register_cubit.dart';
import 'package:bloc_custom_firebase/logic/bloc/google_register/invite_controller/invite_cubit.dart';
import 'package:bloc_custom_firebase/logic/bloc/theme_cubit/theme_cubit.dart';
import 'package:bloc_custom_firebase/ui/screens/google_register/widgets.dart';
import "package:flutter/material.dart";
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class Reg7 extends StatefulWidget {
  const Reg7({Key? key}) : super(key: key);

  @override
  _Reg7State createState() => _Reg7State();
}

class _Reg7State extends State<Reg7> with WidgetsBindingObserver {
  TextEditingController _invitecontroller = TextEditingController();

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
                context.read<InviteCubit>().reload();
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
                    BlocConsumer<InviteCubit, InviteState>(
                        listener: (context, state) {
                      if (state is InviteInitial) {
                        _invitecontroller.text = "";
                        context.read<InviteCubit>().n = 0;
                      } else if (state is InviteLoad)
                        context.read<InviteCubit>().n = 1;
                      else if (state is InviteError)
                        context.read<InviteCubit>().n = 2;
                      else if (state is Inviteverified) {
                        context
                            .read<GoogleRegisterCubit>()
                            .user_data["invite_code"] = _invitecontroller.text;
                        context.read<InviteCubit>().n = 3;
                        print(context.read<GoogleRegisterCubit>().user_data);
                      }
                    }, builder: (context, state) {
                      if (state is InviteInitial) {
                        return Container(
                          height: (height / (2.5)) * 0.6,
                          width: width,
                          child: Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  "enter your invite code",
                                  style: GoogleFonts.montserrat(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: PinCodeTextField(
                                    controller: _invitecontroller,
                                    appContext: context,
                                    length: 5,
                                    pinTheme: PinTheme(
                                        shape: PinCodeFieldShape.box,
                                        borderRadius: BorderRadius.circular(10),
                                        activeColor: Colors
                                            .grey, //This is the filled bordere color,
                                        activeFillColor: Colors.grey[600],
                                        selectedColor: Colors.grey[700],
                                        selectedFillColor: Colors.grey[700],
                                        inactiveColor: Colors.grey[600],
                                        inactiveFillColor: Colors.grey[600]),
                                    onChanged: (String value) {},
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      } else if (state is InviteLoad) {
                        return Container(
                          height: (height / (2.5)) * 0.6,
                          width: width,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                "wait while we verify the invite",
                                style: GoogleFonts.montserrat(
                                    fontSize: 18, fontWeight: FontWeight.w600),
                              ),
                              LoadingAnimationWidget.dotsTriangle(
                                  color: (Theme.of(context).primaryColor),
                                  size: 30),
                            ],
                          ),
                        );
                      } else if (state is Inviteverified) {
                        return Container(
                          height: (height / (2.5)) * 0.6,
                          width: width,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Your invite was verified ✅✅✅",
                                  style: GoogleFonts.montserrat(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600))
                            ],
                          ),
                        );
                      } else if (state is InviteError) {
                        return Container(
                          height: (height / (2.5)) * 0.6,
                          width: width,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                  "your invite was not valid \n Please Try Again by logging out",
                                  style: GoogleFonts.montserrat(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600)),
                            ],
                          ),
                        );
                      } else
                        return Container(
                          child: Text("abc"),
                        );
                    }),
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
                    print("abc");
                    if (context.read<InviteCubit>().n == 0) {
                      if (_invitecontroller.text.length == 5) {
                        //go verify the code with firebase
                        context
                            .read<InviteCubit>()
                            .verifyinvite(_invitecontroller.text);
                      } else {
                        print("Nope");
                      }
                    } else if (context.read<InviteCubit>().n == 1) {
                      //show a snackbar to tell the user to wait
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Please wait till we load")));
                    } else if (context.read<InviteCubit>().n == 3) {
                      update();
                      Navigator.pushReplacementNamed(context, REGISTER_PAGE8);
                    } else if (context.read<InviteCubit>().n == 2) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text("paina em rashi undho saduv laude")));
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
