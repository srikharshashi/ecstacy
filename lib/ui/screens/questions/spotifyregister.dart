import 'package:bloc_custom_firebase/logic/bloc/question_controller/question_controller_cubit.dart';
import 'package:bloc_custom_firebase/logic/bloc/spotify_cubit/spotify_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../constants.dart';
import '../../../logic/bloc/google_register/google_register_cubit.dart';
import '../../../logic/bloc/theme_cubit/theme_cubit.dart';

class SpotifyRegister extends StatefulWidget {
  const SpotifyRegister({Key? key}) : super(key: key);

  @override
  State<SpotifyRegister> createState() => _SpotifyRegisterState();
}

class _SpotifyRegisterState extends State<SpotifyRegister> {
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
        child: SafeArea(
            child: Scaffold(
          resizeToAvoidBottomInset: false,
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              BlocProvider.of<ThemeCubit>(context).changetheme();
            },
          ),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              height: height,
              width: width,
              decoration: BoxDecoration(
                border: Border.all(
                    width: 3.5, color: Theme.of(context).primaryColor),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: height / 4,
                      width: width,
                      child: SizedBox(
                        height: height / 6,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Ecstacy",
                              style: GoogleFonts.pacifico(fontSize: 30),
                            ),
                            Container(
                              width: 20,
                            ),
                            VerticalDivider(
                                indent: 40,
                                endIndent: 40,
                                thickness: 2,
                                color: Theme.of(context).primaryColor),
                            Container(
                              width: 20,
                            ),
                            Icon(
                              FontAwesomeIcons.spotify,
                              size: 60,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: height / 6,
                      width: width,
                      // padding: EdgeInsets.a,
                      // decoration: BoxDecoration(
                      //   border: Border.all(width: 1, color: Colors.white),
                      // ),
                      child: Center(
                        child: Text(
                          "match based on genre similarity :)",
                          style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.w700, fontSize: 15),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: height / 3,
                      width: width,
                      // decoration: BoxDecoration(
                      //   border: Border.all(width: 1, color: Colors.red),
                      // ),
                      child: BlocConsumer<SpotifyCubit, SpotifyState>(
                        listener: ((context, state) {
                          if (state is SpotifySucess) {
                            context
                                    .read<QuestionControllerCubit>()
                                    .data["genres"] =
                                context.read<SpotifyCubit>().genres;
                          }
                        }),
                        builder: ((context, state) {
                          if (state is SpotifyInitial) {
                            return Center(
                              child: InkWell(
                                onTap: () {
                                  context
                                      .read<SpotifyCubit>()
                                      .connectToSpotify();
                                },
                                child: Container(
                                  height: height / 8,
                                  width: width / 1.8,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25),
                                    border: Border.all(
                                      width: 2,
                                      color: Theme.of(context).primaryColor,
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text("Connect to Spotify",
                                          style: GoogleFonts.montserrat(
                                              fontWeight: FontWeight.w700,
                                              fontSize: 15)),
                                      Icon(
                                        FontAwesomeIcons.spotify,
                                        size: 29,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            );
                          } else if (state is SpotifyLoad) {
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text("connecting...",
                                    style: GoogleFonts.montserrat(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700)),
                                LoadingAnimationWidget.halfTringleDot(
                                    color: Theme.of(context).primaryColor,
                                    size: 45),
                              ],
                            );
                          } else if (state is SpotifySucess) {
                            return Column(
                              children: [
                                Container(
                                  child: Text(
                                      "looks like you love " +
                                          state.topArtist +
                                          " :)",
                                      style: GoogleFonts.montserrat(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w700)),
                                ),
                                Container(
                                  height: height / 30,
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.popAndPushNamed(
                                        context, QUESTIONS_COMP);
                                  },
                                  child: Container(
                                    height: height / 12,
                                    width: width / 1.8,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(25),
                                      border: Border.all(
                                        width: 2,
                                        color: Theme.of(context).primaryColor,
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text("Next",
                                            style: GoogleFonts.montserrat(
                                                fontWeight: FontWeight.w700,
                                                fontSize: 15)),
                                        Container(
                                          width: 10,
                                        ),
                                        Icon(
                                          FontAwesomeIcons.signInAlt,
                                          size: 29,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            );
                          } else {
                            return Column(
                              children: [
                                ElevatedButton(
                                    onPressed: () {
                                      context
                                          .read<SpotifyCubit>()
                                          .connectToSpotify();
                                    },
                                    child: Text("Retry")),
                                Container(
                                  // decoration: BoxDecoration(
                                  //   border: Border.all(
                                  //       width: 1, color: Colors.white),
                                  // ),
                                  child: Text("There was error"),
                                ),
                              ],
                            );
                          }
                        }),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        )));
  }
}
