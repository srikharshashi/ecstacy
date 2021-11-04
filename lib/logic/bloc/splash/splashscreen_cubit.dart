import 'package:bloc/bloc.dart';
import 'package:bloc_custom_firebase/logic/models/user_model.dart';
import 'package:bloc_custom_firebase/services/fb_auth_service.dart';
import 'package:bloc_custom_firebase/services/fb_db.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:meta/meta.dart';

part 'splashscreen_state.dart';

class SplashscreenCubit extends Cubit<SplashscreenState> {
  FB_Service fb_service;
  DataBaseService dataBaseService;

  SplashscreenCubit({required this.fb_service, required this.dataBaseService})
      : super(SplashscreenLoading()) {
    print("In cubit constructor");
    initialize();
  }

  void initialize() async {
    print("In splashscreen cubit");
    await fb_service.initializeFirebase();
    await Future.delayed(Duration(seconds: 2));
    var connectivityResult = await (Connectivity().checkConnectivity());

    if (connectivityResult == ConnectivityResult.none) {
      emit(ConnectivityError());
    }

    if (fb_service.checkSignin()) {
      var user_map =
          await dataBaseService.getusermap(fb_service.get_user_email());
      var user_obj=User.frommap(user_map);
      emit(Loggedin(user: user_obj));
    } else
      emit(UnAuthenticated());
  }
}
