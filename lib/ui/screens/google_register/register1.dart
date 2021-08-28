import 'package:bloc_custom_firebase/constants.dart';
import 'package:bloc_custom_firebase/logic/bloc/google_register/google_register_cubit.dart';
import 'package:bloc_custom_firebase/logic/bloc/onboard/onboard_cubit.dart';
import 'package:bloc_custom_firebase/ui/screens/google_register/register2.dart';
import 'package:bloc_custom_firebase/ui/screens/google_register/widgets.dart';
import "package:flutter/material.dart";
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

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
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState appLifecycleState) {
    super.didChangeAppLifecycleState(appLifecycleState);

    if (appLifecycleState == AppLifecycleState.detached ||
        appLifecycleState == AppLifecycleState.paused ||
        appLifecycleState == AppLifecycleState.inactive) {
      print("ABC");
      BlocProvider.of<GoogleRegisterCubit>(context).logout();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<GoogleRegisterCubit, GoogleRegisterState>(
      listener: (context, state) {
        if (state is GoogleRegisterInterupt)
          Navigator.pushReplacementNamed(context, FRONT_PAGE);
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          title: Text(
            "Ecstacy",
            style: GoogleFonts.pacifico(
                fontSize: 32, fontWeight: FontWeight.w300, color: Colors.black),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Expanded(
                child: Container(
                  height: MediaQuery.of(context).size.height / 8,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      // border: Border.all(color: Colors.black),
                      ),
                  child: Center(
                    child: Text(
                      "Get Onboard with us!",
                      style: GoogleFonts.montserrat(
                          fontSize: 23, fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Container(
                    height: MediaQuery.of(context).size.height / 6,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        // border: Border.all(color: Colors.black),
                        ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Enter your Name",
                          style: GoogleFonts.montserrat(
                              fontSize: 18, fontWeight: FontWeight.w600),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          child: TextField(),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              // Spacer(flex: 1),
              Progressbar(
                page: 1,
              ),
              Divider(),
              Text("1/4"),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(50.0),
                  child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, REGISTER_PAGE2);
                    },
                    child: Container(
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              FontAwesomeIcons.signInAlt,
                              size: 20,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Next",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(20)),
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
