// mport 'package:bloc_custom_firebase/logic/bloc/auth_status/authstatus_cubit.dart';
// import 'package:bloc_custom_firebase/logic/bloc/gender_cubit/gender_cubit.dart';
// import 'package:bloc_custom_firebase/logic/bloc/google_register/google_register_cubit.dart';
// import 'package:bloc_custom_firebase/logic/bloc/google_register/image_uploader/image_uploader_cubit.dart';
// import 'package:bloc_custom_firebase/logic/bloc/location_cubit/location_cubit.dart';
// import 'package:bloc_custom_firebase/logic/bloc/number_cubit/numbercubit.dart';
// import 'package:bloc_custom_firebase/logic/bloc/theme_cubit/theme_cubit.dart';
// import 'package:bloc_custom_firebase/ui/screens/google_register/register_widgets.dart';
// import "package:flutter/material.dart";
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:bloc_custom_firebase/constants.dart';
// import 'package:bloc_custom_firebase/ui/screens/google_register/widgets.dart';
// import 'package:pin_code_fields/pin_code_fields.dart';

// class Reg1 extends StatefulWidget {
//   @override
//   _Reg1State createState() => _Reg1State();
// }

// class _Reg1State extends State<Reg1> with WidgetsBindingObserver {
//   @override
//   void initState() {
//     super.initState();
//     WidgetsBinding.instance!.addObserver(this);
//   }

//   @override
//   void dispose() {
//     WidgetsBinding.instance!.removeObserver(this);
//     super.dispose();
//   }

//   void update() {
//     (context)
//         .read<GoogleRegisterCubit>()
//         .update_page((context).read<GoogleRegisterCubit>().page);
//     print(context.read<GoogleRegisterCubit>().page);
//     (context).read<GoogleRegisterCubit>().page += 1;
//   }

//   @override
//   void didChangeAppLifecycleState(AppLifecycleState appLifecycleState) {
//     super.didChangeAppLifecycleState(appLifecycleState);

//     if (appLifecycleState == AppLifecycleState.detached ||
//         appLifecycleState == AppLifecycleState.paused ||
//         appLifecycleState == AppLifecycleState.inactive) {
//       if (BlocProvider.of<GoogleRegisterCubit>(context).page != 5) {
//         if (BlocProvider.of<GoogleRegisterCubit>(context).page != 6) {
//           if (BlocProvider.of<GoogleRegisterCubit>(context).page != 0) {
//             BlocProvider.of<GoogleRegisterCubit>(context).reset();
//             BlocProvider.of<GoogleRegisterCubit>(context).logout();
//           }
//         }
//       }
//     }
//   }

//   TextEditingController name_controller = TextEditingController(); //done
//   TextEditingController number_controller = TextEditingController(); //done
//   TextEditingController bio_controller = TextEditingController(); //done
//   TextEditingController phone_controller = TextEditingController(); //done
//   TextEditingController gender_controller = TextEditingController(); //done
//   //get email rom firebase user
//   TextEditingController photourl_controller = TextEditingController();
//   TextEditingController otpcontroller = TextEditingController();

//   //get invite
//   TextEditingController invite_controller_out = TextEditingController();
//   bool gender_enable = false;
//   bool photo_enable = false;
//   bool location_enable = false;
//   bool invite_enable = false;
//   late Position position;

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => ImageUploaderCubit(),
//       child: MultiBlocListener(
//         listeners: [
//           BlocListener<ImageUploaderCubit, ImageUploaderState>(
//             listener: (context, state) {
//               if (state is ImageUploader1done) {
//                 print("In bloc listner photo uploaded");
//                 photourl_controller.text = (state).img1url;
//                 photo_enable = ((state)).enable;
//               } else {
//                 photo_enable = false;
//               }
//             },
//           ),
//           BlocListener<GoogleRegisterCubit, GoogleRegisterState>(
//             listener: (context, register_state) {
//               if (register_state is GoogleRegisterInterupt) {
//                 BlocProvider.of<GoogleRegisterCubit>(context).page = 1;
//                 BlocProvider.of<GoogleRegisterCubit>(context).update_page(1);
//                 Navigator.pushReplacementNamed(context, FRONT_PAGE);
//               } else if (register_state is LocationRegister) {
//                 BlocProvider.of<LocationCubit>(context).get_location();
//               } else if (register_state is Invitevalid) {
//                 invite_enable = true;
//               } else if (register_state is GetInvite) {
//                 invite_controller_out = (register_state).invite_contoller;
//               } else {
//                 gender_enable = false;
//                 photo_enable = false;
//                 location_enable = false;
//                 invite_enable = false;
//               }
//             },
//           ),
//           BlocListener<LocationCubit, LocationState>(
//             listener: (context, state) {
//               if (state is LocationSucess) {
//                 position = state.position;
//               }
//             },
//             child: Container(),
//           )
//         ],
//         child: Scaffold(
//           floatingActionButton: FloatingActionButton(
//             onPressed: () {
//               BlocProvider.of<ThemeCubit>(context).changetheme();
//             },
//           ),
//           resizeToAvoidBottomInset: false,
//           appBar: AppBar(
//             actions: [
//               IconButton(
//                   onPressed: () {
//                     BlocProvider.of<GoogleRegisterCubit>(context).logout();
//                     BlocProvider.of<GenderCubit>(context).reset();
//                     context.read<NumberRegistercubit>().reload();
//                   },
//                   icon: Icon(
//                     FontAwesomeIcons.powerOff,
//                     color: Theme.of(context).iconTheme.color,
//                   )),
//             ],
//             backgroundColor: Colors.transparent,
//             actionsIconTheme: Theme.of(context).iconTheme,
//             elevation: 0,
//             centerTitle: true,
//             title: Text(
//               "Ecstacy",
//             ),
//           ),
//           body: Padding(
//             padding: EdgeInsets.all(10),
//             child: Container(
//               height: double.infinity,
//               width: double.infinity,
//               decoration: BoxDecoration(
//                   // border: Border.all(color: Colors.black),
//                   ),
//               child: Column(
//                 children: [
//                   Expanded(
//                     flex: 1,
//                     child: Container(
//                       alignment: Alignment.center,
//                       decoration: BoxDecoration(
//                           // border: Border.all(color: Colors.black),
//                           ),
//                       child: Text(
//                         "get onboard with us!",
//                         style: GoogleFonts.montserrat(
//                           fontSize: 20,
//                           fontWeight: FontWeight.w600,
//                         ),
//                       ),
//                     ),
//                   ),
//                   Expanded(
//                     child: Container(
//                       // margin: EdgeInsets.all(20)
//                       alignment: Alignment.center,
//                       decoration: BoxDecoration(
//                           // border: Border.all(color: Colors.red),
//                           ),
//                       child:
//                           BlocBuilder<GoogleRegisterCubit, GoogleRegisterState>(
//                               builder: (context, state) {
//                         int num =
//                             BlocProvider.of<GoogleRegisterCubit>(context).page;
//                         if (state is GoogleRegisterInitial)
//                           return NameField(
//                             namecontroller: name_controller,
//                           );
//                         else if (state is NumberRegister) {
//                           return NumberField(
//                               numbercontroller: number_controller);
//                         } else if (state is GenderRegister) {
//                           return BlocListener<GenderCubit, GenderState>(
//                             listener: (context, state) {
//                               if (state is MaleSelect) {
//                                 gender_controller.text = "M";
//                                 gender_enable = true;
//                               } else if (state is FemaleSelect) {
//                                 gender_controller.text = "F";
//                                 gender_enable = true;
//                               } else if (state is OtherSelect) {
//                                 gender_controller.text = "O";
//                               }
//                             },
//                             child: GenderSelect(),
//                           );
//                         } else if (state is BioRegister) {
//                           return Register3done(bio_controller: bio_controller);
//                         } else if (state is ImageRegister) {
//                           return BlocBuilder<ImageUploaderCubit,
//                               ImageUploaderState>(
//                             builder: (context, state) {
//                               if (state is ImageUploaderInitial) {
//                                 return ImageUploadinitial(
//                                     name_controller: name_controller);
//                               } else if (state is ImageVerifiyLoad) {
//                                 return Column(
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceAround,
//                                   children: [
//                                     Text(
//                                       "Please wait till we Verify it",
//                                       style: GoogleFonts.montserrat(
//                                           fontSize: 18,
//                                           fontWeight: FontWeight.w600),
//                                     ),
//                                     Container(
//                                       child: SpinKitDoubleBounce(
//                                           color:
//                                               Theme.of(context).primaryColor),
//                                     ),
//                                   ],
//                                 );
//                               } else if (state is ImageVErifyFail) {
//                                 return Column(
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceAround,
//                                   children: [
//                                     Text(
//                                       "We have failed to verify if as there were no faces found",
//                                       style: GoogleFonts.montserrat(
//                                           fontSize: 18,
//                                           fontWeight: FontWeight.w600),
//                                     ),
//                                     ElevatedButton(
//                                         style: ButtonStyle(
//                                           backgroundColor:
//                                               MaterialStateProperty.all(
//                                                   Theme.of(context)
//                                                       .primaryColor),
//                                         ),
//                                         onPressed: () {
//                                           context
//                                               .read<ImageUploaderCubit>()
//                                               .reset();
//                                         },
//                                         child: Text("Retry"))
//                                   ],
//                                 );
//                               } else if (state is ImageVerifyMultiplefaces) {
//                                 return Column(
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceAround,
//                                   children: [
//                                     Text(
//                                       "There were mutliple faces found ",
//                                       style: GoogleFonts.montserrat(
//                                           fontSize: 18,
//                                           fontWeight: FontWeight.w600),
//                                     ),
//                                     Text(
//                                       "please try again",
//                                       style: GoogleFonts.montserrat(
//                                           fontSize: 18,
//                                           fontWeight: FontWeight.w600),
//                                     ),
//                                     ElevatedButton(
//                                         style: ButtonStyle(
//                                           backgroundColor:
//                                               MaterialStateProperty.all(
//                                                   Theme.of(context)
//                                                       .primaryColor),
//                                         ),
//                                         onPressed: () {
//                                           context
//                                               .read<ImageUploaderCubit>()
//                                               .reset();
//                                         },
//                                         child: Text("Retry"))
//                                   ],
//                                 );
//                               } else if (state is ImageVerifyPass) {
//                                 return Column(
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceAround,
//                                   children: [
//                                     Text(
//                                       "Please wait till we Upload it ",
//                                       style: GoogleFonts.montserrat(
//                                           fontSize: 18,
//                                           fontWeight: FontWeight.w600),
//                                     ),
//                                     Text(
//                                       "Found 1 Face",
//                                       style: GoogleFonts.montserrat(
//                                           fontSize: 18,
//                                           fontWeight: FontWeight.w600),
//                                     ),
//                                     Container(
//                                       child: SpinKitDoubleBounce(
//                                           color:
//                                               Theme.of(context).primaryColor),
//                                     ),
//                                   ],
//                                 );
//                               } else if (state is ImageUploader1done) {
//                                 return ImageUploadFinal(url: state.img1url);
//                               } else
//                                 return Container();
//                             },
//                           );
//                         } else if (state is LocationRegister) {
//                           return BlocBuilder<LocationCubit, LocationState>(
//                             builder: (context, state) {
//                               print("abc");
//                               if (state is LocationInitial) {
//                                 return Column(
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceAround,
//                                   children: [
//                                     Text(
//                                       "please wait till we get the location",
//                                       style: GoogleFonts.montserrat(
//                                           fontSize: 18,
//                                           fontWeight: FontWeight.w600),
//                                     ),
//                                     Container(
//                                       child: SpinKitDoubleBounce(
//                                           color:
//                                               Theme.of(context).primaryColor),
//                                     ),
//                                   ],
//                                 );
//                               } else if (state is LocationSucess) {
//                                 location_enable = true;
//                                 return Column(
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceAround,
//                                   children: [
//                                     Text(
//                                       "your location is ${state.location.toLowerCase()} 📌",
//                                       style: GoogleFonts.montserrat(
//                                           fontSize: 18,
//                                           fontWeight: FontWeight.w600),
//                                     ),
//                                     ElevatedButton(
//                                       onPressed: () {
//                                         context
//                                             .read<LocationCubit>()
//                                             .get_location();
//                                       },
//                                       child: Text("Try Again"),
//                                       style: ButtonStyle(
//                                         backgroundColor:
//                                             MaterialStateProperty.all(
//                                                 Theme.of(context).primaryColor),
//                                       ),
//                                     )
//                                   ],
//                                 );
//                               } else if (state is LocationError) {
//                                 return Container();
//                               } else {
//                                 return Text("Ooof");
//                               }
//                             },
//                           );
//                         } //register 5 done
//                         else if (state is GetInvite) {
//                           return Container(
//                               child: Column(
//                             mainAxisAlignment: MainAxisAlignment.spaceAround,
//                             children: [
//                               Text(
//                                 "enter your invite code",
//                                 style: GoogleFonts.montserrat(
//                                     fontSize: 18, fontWeight: FontWeight.w600),
//                               ),
//                               Padding(
//                                 padding:
//                                     const EdgeInsets.symmetric(horizontal: 20),
//                                 child: PinCodeTextField(
//                                   appContext: context,
//                                   length: 5,
//                                   controller: state.invite_contoller,
//                                   onChanged: (abc) {},
//                                   pinTheme: PinTheme(
//                                       shape: PinCodeFieldShape.box,
//                                       borderRadius: BorderRadius.circular(10),
//                                       activeColor: Colors
//                                           .grey, //This is the filled bordere color,
//                                       activeFillColor: Colors.grey[600],
//                                       selectedColor: Colors.grey[700],
//                                       selectedFillColor: Colors.grey[700],
//                                       inactiveColor: Colors.grey[600],
//                                       inactiveFillColor: Colors.grey[600]),
//                                 ),
//                               )
//                             ],
//                           ));
//                         } else if (state is GetInviteLoad) {
//                           return Column(
//                             mainAxisAlignment: MainAxisAlignment.spaceAround,
//                             children: [
//                               Text(
//                                 "let us verify it asap",
//                                 style: GoogleFonts.montserrat(
//                                     fontSize: 18, fontWeight: FontWeight.w600),
//                               ),
//                               Container(
//                                 child: SpinKitDoubleBounce(
//                                     color: Theme.of(context).primaryColor),
//                               ),
//                             ],
//                           );
//                         } else if (state is Inviteinvalid) {
//                           return Column(
//                             mainAxisAlignment: MainAxisAlignment.spaceAround,
//                             children: [
//                               Text(
//                                 "your invite is invalid",
//                                 style: GoogleFonts.montserrat(
//                                     fontSize: 18, fontWeight: FontWeight.w600),
//                               ),
//                               ElevatedButton(
//                                 onPressed: () {
//                                   context
//                                       .read<GoogleRegisterCubit>()
//                                       .invitereload();
//                                 },
//                                 child: Text("Try Again"),
//                                 style: ButtonStyle(
//                                   backgroundColor: MaterialStateProperty.all(
//                                       Theme.of(context).primaryColor),
//                                 ),
//                               )
//                             ],
//                           );
//                         } else if (state is Invitevalid) {
//                           return Text(
//                             "your invite was validated ✔️✔️",
//                             style: GoogleFonts.montserrat(
//                                 fontSize: 18, fontWeight: FontWeight.w600),
//                           );
//                         } else if (state is RegisteringUser) {
//                           return Column(
//                             mainAxisAlignment: MainAxisAlignment.spaceAround,
//                             children: [
//                               Text(
//                                 "registering you on our servers",
//                                 style: GoogleFonts.montserrat(
//                                     fontSize: 18, fontWeight: FontWeight.w600),
//                               ),
//                               Container(
//                                 child: SpinKitDoubleBounce(
//                                     color: Theme.of(context).primaryColor),
//                               ),
//                             ],
//                           );
//                         } else if (state is UserRegistered) {
//                           return Text(
//                             "you have been registered ✔️✔️",
//                             style: GoogleFonts.montserrat(
//                                 fontSize: 18, fontWeight: FontWeight.w600),
//                           );
//                         } else if (state is UserRegisterError) {
//                           return Column(
//                             mainAxisAlignment: MainAxisAlignment.spaceAround,
//                             children: [
//                               Text(
//                                 " there was an error registering you",
//                                 style: GoogleFonts.montserrat(
//                                     fontSize: 18, fontWeight: FontWeight.w600),
//                               ),
//                               ElevatedButton(
//                                 onPressed: () {
//                                   context
//                                       .read<GoogleRegisterCubit>()
//                                       .registeruser(
//                                           name_controller.text,
//                                           number_controller.text,
//                                           bio_controller.text,
//                                           gender_controller.text,
//                                           photourl_controller.text,
//                                           position);
//                                 },
//                                 child: Text("Try Again"),
//                                 style: ButtonStyle(
//                                   backgroundColor: MaterialStateProperty.all(
//                                       Theme.of(context).primaryColor),
//                                 ),
//                               )
//                             ],
//                           );
//                         } else {
//                           return Container(
//                             child: Text("no state"),
//                           );
//                         }
//                       } //builder
//                               ),
//                     ),
//                   ),
//                   Expanded(
//                     flex: 1,
//                     child: Container(
//                       alignment: Alignment.center,
//                       decoration: BoxDecoration(
//                           // border: Border.all(color: Colors.red),
//                           ),
//                       child:
//                           BlocBuilder<GoogleRegisterCubit, GoogleRegisterState>(
//                         builder: (context, state) {
//                           return ProgressBar(
//                             page: context.read<GoogleRegisterCubit>().page,
//                           );
//                         },
//                       ),
//                     ),
//                   ),
//                   BlocBuilder<GoogleRegisterCubit, GoogleRegisterState>(
//                     builder: (context, state) {
//                       return Expanded(
//                         child: Container(
//                           padding: EdgeInsets.all(40),
//                           decoration: BoxDecoration(),
//                           child: InkWell(
//                             onTap: () {
//                               int num =
//                                   context.read<GoogleRegisterCubit>().page;
//                               print(num);
//                               if (num == 1) {
//                                 if (name_controller.text != "") {
//                                   update();
//                                 } else {
//                                   ScaffoldMessenger.of(context).showSnackBar(
//                                       SnackBar(
//                                           content: Text(
//                                               "Please Provide proper name!")));
//                                 }
//                               } else if (num == 2) {
//                                 if (number_controller.text != "" &&
//                                     number_controller.text.length == 10) {
//                                   update();
//                                 } else
//                                   ScaffoldMessenger(
//                                       child: SnackBar(
//                                           content:
//                                               Text("Enter a Valid Number")));
//                               } else if (num == 3) {
//                                 print("Page 3");
//                                 if (gender_enable) {
//                                   update();
//                                 } else {
//                                   ScaffoldMessenger.of(context).showSnackBar(
//                                       SnackBar(
//                                           content: Text(
//                                               "Please Select an option!")));
//                                 }
//                               } else if (num == 4) {
//                                 if (bio_controller.text.length > 5) {
//                                   update();
//                                 } else {
//                                   ScaffoldMessenger.of(context).showSnackBar(
//                                       SnackBar(
//                                           content: Text(
//                                               "Enter a valid bio > 8 words!")));
//                                 }
//                               } else if (num == 5) {
//                                 if (photo_enable) {
//                                   update();
//                                 } else {
//                                   ScaffoldMessenger.of(context).showSnackBar(
//                                       SnackBar(
//                                           content: Text("Chose a picture!")));
//                                 }
//                               } else if (num == 6) {
//                                 if (location_enable) {
//                                   update();
//                                   // .pushReplacementNamed(
//                                   //     context, HOME_ROUTE);Navigator
//                                 } else {
//                                   ScaffoldMessenger.of(context).showSnackBar(
//                                       SnackBar(
//                                           content:
//                                               Text("Location Denied / Error")));
//                                 }
//                               } else if (num == 7) {
//                                 int n = state.num;
//                                 if (n == 7) {
//                                   if ((state as GetInvite)
//                                           .invite_contoller
//                                           .text
//                                           .length ==
//                                       5) {
//                                     context
//                                         .read<GoogleRegisterCubit>()
//                                         .verifyinvite((state as GetInvite)
//                                             .invite_contoller
//                                             .text);
//                                   } else {
//                                     ScaffoldMessenger.of(context).showSnackBar(
//                                         SnackBar(
//                                             content:
//                                                 Text("Enter a valid invite")));
//                                   }
//                                 } else if (n == 9) {
//                                   print(
//                                       "Name : ${name_controller.text} \n Number : ${number_controller.text} \n Bio : ${bio_controller.text} \n Gender : ${gender_controller.text} \n  PhotoURL : ${photourl_controller.text}");
//                                   context
//                                       .read<GoogleRegisterCubit>()
//                                       .registeruser(
//                                           name_controller.text,
//                                           number_controller.text,
//                                           bio_controller.text,
//                                           gender_controller.text,
//                                           photourl_controller.text,
//                                           position);
//                                 } else if (n == 11) {
//                                   if (state is UserRegistered) {
//                                     context
//                                         .read<AuthstatusCubit>()
//                                         .autheticateuser(state.user);
//                                     Navigator.pushReplacementNamed(
//                                         context, QUESTIONS_HOME);
//                                   }
//                                 }
//                               }
//                             },
//                             child: Container(
//                               decoration: BoxDecoration(
//                                 border: Border.all(
//                                     color: Theme.of(context).primaryColor),
//                                 borderRadius: BorderRadius.circular(40),
//                               ),
//                               child: Row(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   Text(
//                                     "Next  ",
//                                     style: GoogleFonts.montserrat(
//                                       fontSize: 20,
//                                       fontWeight: FontWeight.w600,
//                                     ),
//                                   ),
//                                   Icon(FontAwesomeIcons.arrowAltCircleRight)
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ),
//                       );
//                     },
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
