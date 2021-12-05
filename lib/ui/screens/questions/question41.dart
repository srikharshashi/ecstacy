import 'package:bloc_custom_firebase/logic/bloc/theme_cubit/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Question41 extends StatefulWidget {
  const Question41({Key? key}) : super(key: key);

  @override
  _Question41State createState() => _Question41State();
}

class _Question41State extends State<Question41> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          BlocProvider.of<ThemeCubit>(context).changetheme();
        },
      ),
      appBar: AppBar(
        centerTitle: true,
        title: Text("Ecstacy"),
      ),
    );
  }
}
