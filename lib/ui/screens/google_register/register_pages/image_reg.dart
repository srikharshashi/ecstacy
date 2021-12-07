import 'dart:io';

import 'package:bloc_custom_firebase/constants.dart';
import 'package:bloc_custom_firebase/logic/bloc/google_register/google_register_cubit.dart';
import 'package:bloc_custom_firebase/logic/bloc/google_register/image_uploader/image_uploader_cubit.dart';
import 'package:bloc_custom_firebase/logic/bloc/theme_cubit/theme_cubit.dart';
import 'package:bloc_custom_firebase/ui/screens/google_register/widgets.dart';
import "package:flutter/material.dart";
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class Reg6 extends StatefulWidget {
  const Reg6({Key? key}) : super(key: key);

  @override
  _Reg6State createState() => _Reg6State();
}

class _Reg6State extends State<Reg6> with WidgetsBindingObserver {
  bool _enable = false;

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
    print("N :${(context).read<GoogleRegisterCubit>().page}");

    (context).read<GoogleRegisterCubit>().page += 1;
    print("N : ${(context).read<GoogleRegisterCubit>().page}  later");
  }

  Future<File?> pickimage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return null;
      File imgtemporary = File(image.path);
      return imgtemporary;
    } on PlatformException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Failed to upload image Permission")));
    }
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
      child: BlocProvider(
        create: (context) => ImageUploaderCubit(),
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
                        child: BlocConsumer<ImageUploaderCubit,
                            ImageUploaderState>(
                          listener: (context, state) {
                            if (state is ImageUploader1done) {
                              _enable = true;
                              context
                                  .read<GoogleRegisterCubit>()
                                  .user_data["photoURL"] = state.img1url;
                            } else
                              _enable = false;
                          },
                          builder: (context, state) {
                            if (state is ImageUploaderInitial) {
                              return Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Let's get some pictures of yours! 😙",
                                    style: GoogleFonts.montserrat(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      pickimage().then((image_file) {
                                        BlocProvider.of<ImageUploaderCubit>(
                                                context)
                                            .uploadimage(image_file, "name");
                                      });
                                    },
                                    child: Container(
                                      height: 90,
                                      width: 90,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Theme.of(context)
                                                          .brightness ==
                                                      Brightness.dark
                                                  ? Colors.white
                                                  : Colors.black)),
                                      child: Center(
                                        child: Icon(
                                          Icons.add,
                                          color: Theme.of(context).brightness ==
                                                  Brightness.dark
                                              ? Colors.white
                                              : Colors.black,
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              );
                            } else if (state is ImageVerifiyLoad) {
                              return Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    "verifying the image",
                                    style: GoogleFonts.montserrat(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  LoadingAnimationWidget.halfTringleDot(
                                      color: Theme.of(context).primaryColor,
                                      size: 45)
                                ],
                              );
                            } else if (state is ImageVerifyMultiplefaces) {
                              return Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    "The Image had multiple faces ",
                                    style: GoogleFonts.montserrat(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  ElevatedButton(
                                      onPressed: () {
                                        context
                                            .read<ImageUploaderCubit>()
                                            .reset();
                                      },
                                      style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                                  Theme.of(context)
                                                      .primaryColor)),
                                      child: Text("try again")),
                                ],
                              );
                            } else if (state is ImageVerifyPass) {
                              return Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    "you have been verified ✅✅",
                                    style: GoogleFonts.montserrat(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  Text(
                                    "please wait as we upload it!",
                                    style: GoogleFonts.montserrat(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  LoadingAnimationWidget.halfTringleDot(
                                      color: Theme.of(context).primaryColor,
                                      size: 45)
                                ],
                              );
                            } else if (state is ImageUploader1done) {
                              return Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    "heyy we got it!",
                                    style: GoogleFonts.montserrat(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  CircleAvatar(
                                    backgroundImage:
                                        NetworkImage(state.img1url),
                                    radius: 50,
                                  )
                                ],
                              );
                            } else if (state is ImageVErifyFail) {
                              return Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    "there were no faces found",
                                    style: GoogleFonts.montserrat(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  ElevatedButton(
                                      onPressed: () {
                                        context
                                            .read<ImageUploaderCubit>()
                                            .reset();
                                      },
                                      style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                                  Theme.of(context)
                                                      .primaryColor)),
                                      child: Text("try again"))
                                ],
                              );
                            } else {
                              return Container(
                                child: Text("Error lmao"),
                              );
                            }
                          },
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
                      if (_enable) {
                        update();
                        Navigator.pushReplacementNamed(context, REGISTER_PAGE7);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text("Please waitt | select an image")));
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
      ),
    );
  }
}
