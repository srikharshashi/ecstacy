import 'package:bloc_custom_firebase/constants.dart';
import 'package:bloc_custom_firebase/logic/bloc/google_register/google_register_cubit.dart';
import 'package:bloc_custom_firebase/logic/bloc/theme_cubit/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {
        BlocProvider.of<ThemeCubit>(context).changetheme(Theme.of(context));
      }),
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                context.read<GoogleRegisterCubit>().logout();
                Navigator.pushReplacementNamed(context, FRONT_PAGE);
              },
              icon: Icon(Icons.account_circle_outlined)),
        ],
        centerTitle: true,
        title: Text("Ecstacy"),
        bottom: TabBar(
          indicatorColor: Theme.of(context).primaryColor,
          indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(50), // Creates border
              color: Theme.of(context).primaryColor),
          controller: tabController,
          tabs: [
            tab(iconData: FontAwesomeIcons.binoculars),
            tab(iconData: FontAwesomeIcons.comment),
            tab(iconData: FontAwesomeIcons.heart),
            tab(iconData: FontAwesomeIcons.userAlt)
          ],
        ),
      ),
      body: TabBarView(controller: tabController, children: [
        Center(
          child: Text("1"),
        ),
        Center(
          child: Text("2"),
        ),
        Center(
          child: Text("3"),
        ),
        Center(
          child: Text("4"),
        ),
      ]),
    );
  }

  // @override
  // void dispose() {
  //   tabController.dispose();
  //   super.dispose();
  // }
}

class tab extends StatelessWidget {
  IconData iconData;
  tab({required this.iconData});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Icon(
          iconData,
          size: 24,
        ),
      ),
    );
  }
}
