import 'package:bloc/bloc.dart';
import 'package:bloc_custom_firebase/services/fb_auth_service.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_core/firebase_core.dart';

part 'numbercubit_state.dart';

class NumberRegistercubit extends Cubit<NumberState> {
  NumberRegistercubit({required this.fb_service}) : super(NumbercubitInitial());
  FB_Service fb_service;
  int code = 0;
  void login(String phonenumber) async {
    emit(NumberLoad());
    code = 1;
    bool pt1 = await fb_service.phoneSignIn(phoneNumber: "+91" + phonenumber);
    if (pt1) {
      emit(GetOTP());
      code = 2;
    } else {
      emit(LoginError());
      code = -1;
    }
  }

  void verifyOTP(String OTP) async {
    emit(NumberLoad());
    code = 1;
    bool pt2 = await fb_service.signinwithOTP(OTP);
    if (pt2) {
      emit(NumberRegistered());
      code = 3;
    } else {
      emit(LoginError());
      code = -1;
    }
  }

  void reload() {
    emit(NumbercubitInitial());
    code = 0;
  }
}
