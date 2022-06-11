import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_custom_firebase/logic/models/user_model.dart';
import 'package:equatable/equatable.dart';

part 'authstatus_state.dart';

class AuthstatusCubit extends Cubit<AuthstatusState> {
  AuthstatusCubit() : super(Unautheticated());
  User? user = null;
  void autheticateuser(User userc) {
    // void autheticateuser() {
    user = userc;
    emit(Authenticated(user: userc));

    // emit(Authenticated());
  }

  void unauthenticate() {
    emit(Unautheticated());
  }
}
