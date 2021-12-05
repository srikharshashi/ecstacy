import 'package:bloc/bloc.dart';
import 'package:bloc_custom_firebase/logic/models/user_model.dart';
import 'package:equatable/equatable.dart';

part 'authstatus_state.dart';

class AuthstatusCubit extends Cubit<AuthstatusState> {
  AuthstatusCubit() : super(Unautheticated());

  void autheticateuser(User user) {
  // void autheticateuser() {
    emit(Authenticated(user: user));
    // emit(Authenticated());
  }

  void unauthenticate() {
    emit(Unautheticated());
  }
}
