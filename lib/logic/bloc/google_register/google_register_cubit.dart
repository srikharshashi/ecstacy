import 'package:bloc/bloc.dart';
import 'package:bloc_custom_firebase/logic/models/user_model.dart';
import 'package:bloc_custom_firebase/services/fb_auth_service.dart';
import 'package:bloc_custom_firebase/services/fb_db.dart';
import 'package:bloc_custom_firebase/services/fb_storage.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';

part 'google_register_state.dart';

class GoogleRegisterCubit extends Cubit<GoogleRegisterState> {
  FB_Service fb_service;
  DataBaseService dataBaseService;
  int page = 1;

  GoogleRegisterCubit({required this.fb_service, required this.dataBaseService})
      : super(GoogleRegisterInitial());

  void logout() async {
    print("In cubit off register page");
    emit(GoogleRegisterInterupt());
    await fb_service.logout();
    reset();
  }

  void update_page(int num) {
    if (num == 1)
      emit(NumberRegister());
    else if (num == 2)
      emit(GenderRegister());
    else if (num == 3)
      emit(BioRegister());
    else if (num == 4)
      emit(ImageRegister());
    else if (num == 5) {
      emit(LocationRegister());
    } else if (num == 6)
      emit(GetInvite(invite_contoller: TextEditingController()));
  }

  void reset() {
    emit(GoogleRegisterInitial());
  }

  void verifyinvite(String invite) async {
    emit(GetInviteLoad());
    bool verify = await dataBaseService.verifyinvite(invite);
    if (verify) {
      emit(Invitevalid());
    } else {
      emit(Inviteinvalid());
    }
  }

  void invitereload() {
    emit(GetInvite(invite_contoller: TextEditingController()));
  }

  void registeruser(String name, String number, String bio, String gender,
      String photourl, Position position) async {
    emit(RegisteringUser());
    String email = fb_service.get_user_email() ;
    bool status = await dataBaseService.adduser(
        name, number, gender, photourl, bio, email, position);
    if (status) {
      //TODO: Add this user to shared preferences
      User user = User(
          bio: bio,
          name: name,
          email: email,
          photoURL: photourl,
          number: number,
          gender: gender);
      emit(UserRegistered(user: user));
    } else {
      emit(UserRegisterError());
    }
  }
}
