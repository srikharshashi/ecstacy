import 'dart:io';
import 'package:bloc_custom_firebase/logic/bloc/gender_cubit/gender_cubit.dart';
import 'package:bloc_custom_firebase/logic/bloc/google_register/image_uploader/image_uploader_cubit.dart';
import 'package:bloc_custom_firebase/logic/bloc/location_cubit/location_cubit.dart';
import 'package:bloc_custom_firebase/logic/bloc/theme_cubit/theme_cubit.dart';
import "package:flutter/material.dart";
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bloc_custom_firebase/constants.dart';
import 'package:bloc_custom_firebase/logic/bloc/google_register/google_register_cubit.dart';
import 'package:bloc_custom_firebase/ui/screens/google_register/widgets.dart';
import 'package:image_picker/image_picker.dart';

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
      if (BlocProvider.of<GoogleRegisterCubit>(context).page != 5) {
        print("in page 5");
        if (BlocProvider.of<GoogleRegisterCubit>(context).page != 6) {
          print("ABC");
          BlocProvider.of<GoogleRegisterCubit>(context).reset();
          BlocProvider.of<GoogleRegisterCubit>(context).logout();
        }
      }
    }
  }

  TextEditingController name_controller = TextEditingController(); //done
  TextEditingController number_controller = TextEditingController(); //done
  TextEditingController bio_controller = TextEditingController(); //done
  TextEditingController phone_controller = TextEditingController(); //done
  TextEditingController gender_controller = TextEditingController(); //done
  //get email rom firebase user
  TextEditingController photourl_controller = TextEditingController();
  // User current_user = User();

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
  Widget build(BuildContext context) {
    bool gender_enable = false;
    bool photo_enable = false;
    bool location_enable = false;

    return BlocProvider(
      create: (context) => ImageUploaderCubit(),
      child: MultiBlocListener(
        listeners: [
          BlocListener<ImageUploaderCubit, ImageUploaderState>(
            listener: (context, state) {
              if (state is ImageUploader1done) {
                print("In bloc listner photo uploaded");
                photourl_controller.text =
                    (state as ImageUploader1done).img1url;
                photo_enable = ((state as ImageUploader1done)).enable;
              }
            },
          ),
          BlocListener<GoogleRegisterCubit, GoogleRegisterState>(
            listener: (context, register_state) {
              if (register_state is GoogleRegisterInterupt) {
                BlocProvider.of<GoogleRegisterCubit>(context).page = 1;
                BlocProvider.of<GoogleRegisterCubit>(context).update_page(1);
                Navigator.pushReplacementNamed(context, FRONT_PAGE);
              } else if (register_state is Register5Done) {
                BlocProvider.of<LocationCubit>(context).get_location();
              }
            },
          ),
          // BlocListener<LocationCubit, LocationState>(
          //     listener: (context, location_state) {
          //   if (location_state is LocationInitial) {
          //     BlocProvider.of<LocationCubit>(context).ask_perms();
          //   }
          // })
        ],
        child: Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              BlocProvider.of<ThemeCubit>(context)
                  .changetheme(Theme.of(context));
            },
          ),
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            actions: [
              IconButton(
                  onPressed: () {
                    BlocProvider.of<GoogleRegisterCubit>(context).logout();
                    BlocProvider.of<GenderCubit>(context).reset();
                  },
                  icon: Icon(
                    FontAwesomeIcons.powerOff,
                    color: Theme.of(context).iconTheme.color,
                  )),
            ],
            backgroundColor: Colors.transparent,
            actionsIconTheme: Theme.of(context).iconTheme,
            elevation: 0,
            centerTitle: true,
            title: Text(
              "Ecstacy",
              style: Theme.of(context).textTheme.headline1,
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
                        } else if (state is Register2Done) {
                          return BlocListener<GenderCubit, GenderState>(
                            listener: (context, state) {
                              if (state is MaleSelect) {
                                gender_controller.text = "M";
                                gender_enable = true;
                              } else if (state is FemaleSelect) {
                                gender_controller.text = "F";
                                gender_enable = true;
                              } else if (state is OtherSelect) {
                                gender_controller.text = "O";
                              }
                            },
                            child: GenderSelect(),
                          );
                        } else if (state is Register3Done) {
                          return Container(
                            margin: EdgeInsets.all(10),
                            child: Column(
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8.0),
                                  child: Text(
                                    "Tell us something about youself! (Bio)",
                                    style: GoogleFonts.montserrat(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                                Expanded(
                                  child: TextField(
                                    maxLines: 20,
                                    controller: bio_controller,
                                    decoration: InputDecoration(
                                      hintText: "Enter a bio",
                                      fillColor: Colors.grey[300],
                                      // filled: true,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        } else if (state is Register4Done) {
                          return BlocBuilder<ImageUploaderCubit,
                              ImageUploaderState>(
                            builder: (context, state) {
                              if (state is ImageUploaderInitial) {
                                return Container(
                                  // decoration: BoxDecoration(
                                  //     border: Border.all(color: Colors.black)),
                                  child: Column(
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: Container(
                                          alignment: Alignment.center,
                                          // decoration: BoxDecoration(
                                          // border:
                                          //     Border.all(color: Colors.black)),
                                          child: Text(
                                            "Send us a pictures to show em 😗",
                                            style: GoogleFonts.montserrat(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ),
                                      ),
                                      Spacer(flex: 1),
                                      Expanded(
                                        flex: 2,
                                        child: Container(
                                            alignment: Alignment.center,
                                            // decoration: BoxDecoration(
                                            //     border:
                                            //         Border.all(color: Colors.black)),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                InkWell(
                                                  onTap: () {
                                                    pickimage()
                                                        .then((image_file) {
                                                      BlocProvider.of<
                                                                  ImageUploaderCubit>(
                                                              context)
                                                          .uploadimage(
                                                              image_file,
                                                              name_controller
                                                                  .text);
                                                    });
                                                  },
                                                  child: Container(
                                                      width: 90,
                                                      alignment:
                                                          Alignment.center,
                                                      decoration: BoxDecoration(
                                                          border: Border.all(
                                                              color: Colors
                                                                  .black)),
                                                      child: Icon(
                                                          FontAwesomeIcons
                                                              .plus)),
                                                ),
                                              ],
                                            )),
                                      ),
                                    ],
                                  ),
                                );
                              } else if (state is ImageUploaderLoad) {
                                return Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      "Please wait till we upload it",
                                      style: GoogleFonts.montserrat(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Container(
                                      child: SpinKitDoubleBounce(
                                          color:
                                              Theme.of(context).primaryColor),
                                    ),
                                  ],
                                );
                              } else if (state is ImageUploader1done) {
                                return Container(
                                  // decoration: BoxDecoration(
                                  //     border: Border.all(color: Colors.black)),
                                  child: Column(
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: Container(
                                          alignment: Alignment.center,
                                          // decoration: BoxDecoration(
                                          // border:
                                          //     Border.all(color: Colors.black)),
                                          child: Text(
                                            "Hey we got it! 💙",
                                            style: GoogleFonts.montserrat(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ),
                                      ),
                                      Spacer(flex: 1),
                                      Expanded(
                                        flex: 3,
                                        child: Container(
                                            alignment: Alignment.center,
                                            // decoration: BoxDecoration(
                                            //     border: Border.all(
                                            //         color: Colors.black)),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color: Theme.of(context)
                                                                    .canvasColor ==
                                                                Colors.white
                                                            ? Colors.grey
                                                                .withOpacity(
                                                                    0.5)
                                                            : Color(0xFF1a1c1b)
                                                                .withOpacity(
                                                                    0.2),
                                                        blurRadius:
                                                            20.0, // soften the shadow
                                                        spreadRadius:
                                                            0.2, //extend the shadow
                                                        offset: Offset(
                                                          2.0, // Move to right 10  horizontally
                                                          2.0, // Move to bottom 10 Vertically
                                                        ),
                                                      ),
                                                    ],
                                                    // border: Border.all(
                                                    //     color:
                                                    //         Colors.red)),
                                                  ),
                                                  child: ClipOval(
                                                    child: Container(
                                                      width: 100,
                                                      alignment:
                                                          Alignment.center,
                                                      decoration: BoxDecoration(
                                                        image: DecorationImage(
                                                          fit: BoxFit.fill,
                                                          image: NetworkImage(
                                                              state.img1url),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            )),
                                      ),
                                    ],
                                  ),
                                );
                              } else
                                return Container();
                            },
                          );
                        } else if (state is Register5Done) {
                          return BlocBuilder<LocationCubit, LocationState>(
                            builder: (context, state) {
                              print("abc");
                              if (state is LocationInitial) {
                                return Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      "please wait till we get the location",
                                      style: GoogleFonts.montserrat(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Container(
                                      child: SpinKitDoubleBounce(
                                          color:
                                              Theme.of(context).primaryColor),
                                    ),
                                  ],
                                );
                              } else if (state is LocationSucess) {
                                location_enable = true;
                                return Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      "your location is ${state.location.toLowerCase()} 📌",
                                      style: GoogleFonts.montserrat(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    ElevatedButton(
                                      onPressed: () {
                                        context
                                            .read<LocationCubit>()
                                            .get_location();
                                      },
                                      child: Text("Try Again"),
                                      style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                Theme.of(context).primaryColor),
                                      ),
                                    )
                                  ],
                                );
                              } else if (state is LocationError) {
                                return Container();
                              } else {
                                return Text("Ooof");
                              }
                            },
                          );
                        } //register 5 done
                        else if (state is Register6Done) {
                          return Container(
                            child: Text("In register 7"),
                          );
                        } else {
                          return Container(
                            child: Text("no state"),
                          );
                        }
                      } //builder
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
                              BlocProvider.of<GoogleRegisterCubit>(context)
                                  .page;
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
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      content:
                                          Text("Please Provide proper name!")));
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
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      content: Text(
                                          "Please Provide proper number!")));
                            }
                          } else if (num == 3) {
                            print("Page 3");
                            if (gender_enable) {
                              BlocProvider.of<GoogleRegisterCubit>(context)
                                  .update_page(
                                      BlocProvider.of<GoogleRegisterCubit>(
                                              context)
                                          .page);
                              BlocProvider.of<GoogleRegisterCubit>(context)
                                  .page += 1;
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      content:
                                          Text("Please Select an option!")));
                            }
                          } else if (num == 4) {
                            if (bio_controller.text.length > 5) {
                              BlocProvider.of<GoogleRegisterCubit>(context)
                                  .update_page(
                                      BlocProvider.of<GoogleRegisterCubit>(
                                              context)
                                          .page);
                              BlocProvider.of<GoogleRegisterCubit>(context)
                                  .page += 1;
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      content: Text(
                                          "Enter a valid bio > 8 words!")));
                            }
                          } else if (num == 5) {
                            print("In 5");
                            if (photo_enable) {
                              print("In button photo uploaded");

                              print("here");
                              BlocProvider.of<GoogleRegisterCubit>(context)
                                  .update_page(
                                      BlocProvider.of<GoogleRegisterCubit>(
                                              context)
                                          .page);
                              BlocProvider.of<GoogleRegisterCubit>(context)
                                  .page += 1;
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text("Chose a picture!")));
                            }
                          } else if (num == 6) {
                            if (location_enable) {
                              print("In Location enable");
                              BlocProvider.of<GoogleRegisterCubit>(context)
                                  .update_page(
                                      BlocProvider.of<GoogleRegisterCubit>(
                                              context)
                                          .page);
                              BlocProvider.of<GoogleRegisterCubit>(context)
                                  .page += 1;
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      content:
                                          Text("Location Denies / Error")));
                            }
                          }
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: Theme.of(context).primaryColor),
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
      ),
    );
  }
}
