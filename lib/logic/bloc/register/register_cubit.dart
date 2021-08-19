import 'package:bloc/bloc.dart';
import 'package:bloc_custom_firebase/services/fb_auth_service.dart';
import 'package:meta/meta.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  FB_Service fb_service;

  RegisterCubit({required this.fb_service}) : super(RegisterInitial());

  void signin(String email, String password) async {
    emit(RegisterLoad());

    fb_service.registerwithEmail(email, password).then((value) {
      if (value)
        emit(RegisterSuccess());
      else
        emit(RegisterFail());
    });
  }
}
