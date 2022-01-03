import 'package:bloc_custom_firebase/logic/bloc/google_register/google_register_cubit.dart';
import 'package:bloc_custom_firebase/logic/bloc/question_controller/question_controller_cubit.dart';
import 'package:bloc_custom_firebase/logic/bloc/theme_cubit/theme_cubit.dart';
import 'package:bloc_custom_firebase/ui/screens/google_register/widgets.dart';
import "package:flutter/material.dart";
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../constants.dart';

class Questions_Completed extends StatefulWidget {
  const Questions_Completed({Key? key}) : super(key: key);

  @override
  _Questions_CompletedState createState() => _Questions_CompletedState();
}

class _Questions_CompletedState extends State<Questions_Completed> {
  @override
  void initState() {
    print(BlocProvider.of<QuestionControllerCubit>(context).data);
    context.read<QuestionControllerCubit>().submit();
    super.initState();
  }

  bool _enable = false;

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
                ),),
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
                      child: BlocConsumer<QuestionControllerCubit,
                          QuestionControllerState>(
                        listener: (context, state) {
                          if (state is QuestionsSuccess) {
                            _enable = false;
                            
                          }
                        },
                        builder: (context, state) {
                          if (state is QuestionLoad) {
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text("registering please wait",
                                    style: GoogleFonts.montserrat(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700)),
                                LoadingAnimationWidget.halfTringleDot(
                                    color: Theme.of(context).primaryColor,
                                    size: 45)
                              ],
                            );
                          } else if (state is QuestionsSuccess) {
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  "You have been registered",
                                  style: GoogleFonts.montserrat(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700),
                                ),
                              ],
                            );
                          } else {
                            return Container();
                          }
                        },
                      ),
                    ),
                    Container(
                      height: (height / (2.5)) * 0.4,
                      child: ProgressBar(n: 6, page: 6),
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
                    if(_enable)
                    {
                      
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
