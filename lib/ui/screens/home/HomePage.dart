import 'package:bloc_custom_firebase/constants.dart';
import 'package:bloc_custom_firebase/logic/bloc/auth_status/authstatus_cubit.dart';
import 'package:bloc_custom_firebase/logic/bloc/cardcontrollercubi/cardcontroller_cubit.dart';
import 'package:bloc_custom_firebase/logic/bloc/google_register/google_register_cubit.dart';
import 'package:bloc_custom_firebase/logic/bloc/theme_cubit/theme_cubit.dart';
import 'package:bloc_custom_firebase/logic/models/user_model.dart';
import 'package:bloc_custom_firebase/ui/screens/google_register/card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  late PersistentTabController _controller;

  @override
  void initState() {
    _controller = PersistentTabController(initialIndex: 0);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CardcontrollerCubit(),
      child: BlocBuilder<AuthstatusCubit, AuthstatusState>(
        builder: (context, state) {
          if (state is Authenticated)
            return Scaffold(
              appBar: AppBar(
                actions: [
                  IconButton(
                      onPressed: () {
                        context.read<AuthstatusCubit>().unauthenticate();
                        context.read<GoogleRegisterCubit>().logout();
                        Navigator.pushReplacementNamed(context, FRONT_PAGE);
                      },
                      icon: Icon(Icons.account_circle_outlined)),
                ],
                centerTitle: true,
                title: Text("Ecstacy"),
              ),
              body: PersistentTabView(
                context,
                floatingActionButton: FloatingActionButton(
                  onPressed: () {
                    context.read<ThemeCubit>().changetheme();
                  },
                ),

                controller: _controller,
                screens: _buildScreens(state.user),
                items: _navBarsItems(),
                confineInSafeArea: true,
                backgroundColor: Theme.of(context)
                    .appBarTheme
                    .foregroundColor!, // Default is Colors.white.
                handleAndroidBackButtonPress: true, // Default is true.
                resizeToAvoidBottomInset:
                    true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
                stateManagement: true, // Default is true.
                hideNavigationBarWhenKeyboardShows:
                    true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
                decoration: NavBarDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  colorBehindNavBar: Colors.black,
                ),
                popAllScreensOnTapOfSelectedTab: true,
                popActionScreens: PopActionScreensType.all,
                itemAnimationProperties: ItemAnimationProperties(
                  // Navigation Bar's items animation properties.
                  duration: Duration(milliseconds: 200),
                  curve: Curves.ease,
                ),
                screenTransitionAnimation: ScreenTransitionAnimation(
                  // Screen transition animation on change of selected tab.
                  animateTabTransition: true,
                  curve: Curves.ease,
                  duration: Duration(milliseconds: 200),
                ),
                navBarStyle: NavBarStyle.style1,
                // Choose the nav bar style with this property.
              ),
            );
          else
            return Container(
              padding: EdgeInsets.all(90),
              child: Text("oof wrong route ig"),
            );
        },
      ),
    );
  }

  List<Widget> cards = List.generate(
    5,
    (index) => Container(
      color: Colors.blue,
      child: Center(
        child: Text(
          '$index',
          style: TextStyle(fontSize: 60, color: Colors.white),
        ),
      ),
    ),
  );
  List<Widget> _buildScreens(User user) {
    return [
      User_Card(photoURL: user.photoURL),
      Text("2"),
      Text("3"),
      Text("4")
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    var active_color = Theme.of(context).brightness == Brightness.dark
        ? CupertinoColors.systemPurple
        : CupertinoColors.white;
    return [
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.home),
        title: ("Home"),
        activeColorPrimary: active_color,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.bubble_left),
        title: ("Messages"),
        activeColorPrimary: active_color,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.heart),
        title: ("Matches"),
        activeColorPrimary: active_color,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.person),
        title: ("Profile"),
        activeColorPrimary: active_color,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
    ];
  }
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
