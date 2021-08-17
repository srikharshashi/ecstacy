import 'package:bloc/bloc.dart';
import 'package:bloc_custom_firebase/services/fb_service.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:meta/meta.dart';

part 'splashscreen_state.dart';

class SplashscreenCubit extends Cubit<SplashscreenState> {
  FB_Service fb_service;

  SplashscreenCubit({required this.fb_service}) : super(SplashscreenLoading()) {
    print("In cubit constructor");
    initialize();
  }

  void initialize() async {
    print("In splashscreen cubit");
    await fb_service.initializeFirebase();
    await Future.delayed(Duration(seconds: 3));
    var connectivityResult = await (Connectivity().checkConnectivity());

    if (connectivityResult == ConnectivityResult.none) {
      emit(ConnectivityError());
    }

    if (fb_service.checkSignin())
      emit(Loggedin());
    else
      emit(UnAuthenticated());
  }
}
