import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:bloc_custom_firebase/logic/bloc/onboard/onboard_cubit.dart';
import 'package:bloc_custom_firebase/services/fb_auth_service.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'google_register_state.dart';

class GoogleRegisterCubit extends Cubit<GoogleRegisterState> {
  FB_Service fb_service;
  int page = 1;

  GoogleRegisterCubit({
    required this.fb_service,
  }) : super(GoogleRegisterInitial());

  void logout() async {
    print("In cubit off register page");
    emit(GoogleRegisterInterupt());
    await fb_service.logout();
    reset();
  }

  void update_page(int num) {
    if (num == 1)
      emit(Register1Done());
    else if (num == 2)
      emit(Register2Done());
    else if (num == 3)
      emit(Register3Done());
    else if (num == 4)
      emit(Register4Done());
    else if (num == 5) emit(Register5Done());
  }

  void reset() {
    emit(GoogleRegisterInitial());
  }
}
