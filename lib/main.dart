import 'package:bloc_custom_firebase/logic/bloc/login/login_cubit.dart';
import 'package:bloc_custom_firebase/logic/bloc/logout/logout_cubit.dart';
import 'package:bloc_custom_firebase/logic/bloc/onboard/onboard_cubit.dart';
import 'package:bloc_custom_firebase/logic/bloc/register/register_cubit.dart';
import 'package:bloc_custom_firebase/logic/bloc/splash/splashscreen_cubit.dart';
import 'package:bloc_custom_firebase/router.dart';
import 'package:bloc_custom_firebase/services/fb_auth_service.dart';
import 'package:bloc_custom_firebase/services/fb_db.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final AppRouter appRouter = AppRouter();
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => SplashscreenCubit(fb_service: FB_Service())),
        BlocProvider(
            create: (context) => LoginCubit(
                  fb_service: FB_Service(),
                )),
        BlocProvider(
            create: (context) => LogoutCubit(repossitory: FB_Service())),
        BlocProvider(
            create: (context) => RegisterCubit(fb_service: FB_Service())),
        BlocProvider(
            create: (context) => OnboardCubit(
                fb: FB_Service(), dataBaseService: DataBaseService())),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        onGenerateRoute: appRouter.onGenerateRoute,
      ),
    );
  }
}
