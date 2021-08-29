import 'package:bloc_custom_firebase/constants.dart';
import 'package:bloc_custom_firebase/logic/bloc/google_register/google_register_cubit.dart';
import 'package:bloc_custom_firebase/ui/screens/google_register/register2.dart';
import "package:flutter/material.dart";
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class Reg2 extends StatefulWidget {
  @override
  _Reg2State createState() => _Reg2State();
}

class _Reg2State extends State<Reg2> with WidgetsBindingObserver {
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
      ),
    );
  }
}
