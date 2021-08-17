import 'package:bloc_custom_firebase/constants.dart';
import 'package:bloc_custom_firebase/logic/bloc/logout/logout_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocListener<LogoutCubit, LogoutState>(
      listener: (context, state) {
        if(state is LogOutSucess)
          Navigator.pushReplacementNamed(context, LOGIN_ROUTE);
        else
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Logout Failed!")));
      },
      child: Scaffold(
        appBar: AppBar(
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: IconButton(onPressed: () {
                BlocProvider.of<LogoutCubit>(context).logout();
              }, icon: Icon(FontAwesomeIcons.powerOff)),
            )
          ],
          title: Text('Home'),
        ),
        body: Center(
          child: Container(
            child: Text('Hello World'),
          ),
        ),

      ),
    );
  }
}
