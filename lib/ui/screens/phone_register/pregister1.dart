import 'package:bloc_custom_firebase/logic/bloc/gender_cubit/gender_cubit.dart';
import 'package:bloc_custom_firebase/logic/bloc/google_register/google_register_cubit.dart';
import 'package:bloc_custom_firebase/logic/bloc/theme_cubit/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PRegister extends StatefulWidget {
  const PRegister({Key? key}) : super(key: key);

  @override
  _PRegisterState createState() => _PRegisterState();
}

class _PRegisterState extends State<PRegister> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            BlocProvider.of<ThemeCubit>(context).changetheme();
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
            style: Theme.of(context).textTheme.headline2,
          ),
        ));
  }
}
