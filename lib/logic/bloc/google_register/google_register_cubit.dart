import 'package:bloc/bloc.dart';
import 'package:bloc_custom_firebase/logic/bloc/onboard/onboard_cubit.dart';
import 'package:bloc_custom_firebase/services/fb_auth_service.dart';
import 'package:equatable/equatable.dart';

part 'google_register_state.dart';

class GoogleRegisterCubit extends Cubit<GoogleRegisterState> {
  FB_Service fb_service;
  int page=1;

  GoogleRegisterCubit({required this.fb_service,})
      : super(GoogleRegisterInitial());

  void logout() async {
    print("In cubit off register page");
    emit(GoogleRegisterInterupt());
    await fb_service.logout();
  }
}
