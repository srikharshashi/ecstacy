import 'package:bloc/bloc.dart';
import 'package:bloc_custom_firebase/services/fb_auth_service.dart';
import 'package:bloc_custom_firebase/services/fb_db.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
part 'onboard_state.dart';

class OnboardCubit extends Cubit<OnboardState> {
  FB_Service fb;
  DataBaseService dataBaseService;

  OnboardCubit({required this.fb, required this.dataBaseService})
      : super(OnboardInitial());

  void signinwithgoogle() async {
    emit(OnboardLoad());

    bool status = await fb.signInWithGoogle();

    if (status) {
      bool old_user =
          await dataBaseService.verifygoogleuser(fb.get_user_email());
      if (old_user) {
        emit(OnboardHome());
      }
      else
      emit(OnboardRegister());
    } else
      emit(OnboardError());
  }

  void reload() {
    emit(OnboardInitial());
  }
}
