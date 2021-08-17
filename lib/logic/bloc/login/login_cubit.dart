import 'package:bloc/bloc.dart';
import 'package:bloc_custom_firebase/services/fb_service.dart';
part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  FB_Service fb_service;

  LoginCubit({required this.fb_service}) : super(LoginInitial());

  void signin(String email, String password) {
    emit(LoginLoad());
    fb_service.signin(email, password).then((value) {
      if (value) {
        emit(LoginSucesss());
        //  Else make it listen to the stream and make it navigate only if
        //  There is a user which is non null
      } else {
        emit(LoginFail());
      }
    });
  }

  void signinwithgoogle() {
    emit(LoginLoad());

    fb_service.signInWithGoogle().then((value) {
      if (value) {
        emit(LoginSucesss());
        //  Else make it listen to the stream and make it navigate only if
        //  There is a user which is non null
      } else {
        emit(LoginFail());
      }
    });
  }
}
