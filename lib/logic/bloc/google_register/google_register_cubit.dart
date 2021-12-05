import 'package:bloc/bloc.dart';
import 'package:bloc_custom_firebase/logic/models/user_model.dart';
import 'package:bloc_custom_firebase/services/fb_auth_service.dart';
import 'package:bloc_custom_firebase/services/fb_db.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'google_register_state.dart';

class GoogleRegisterCubit extends Cubit<GoogleRegisterState> {
  FB_Service fb_service;
  DataBaseService dataBaseService;
  int page = 1;
  Map<String, dynamic> user_data = {
    "name": "",
    "gender": "",
    "number": "",
    "photoURL": "",
    "position": GeoPoint(0.0, 0.0),
    "age": 0,
    "invite_code": "",
  };

  GoogleRegisterCubit({required this.fb_service, required this.dataBaseService})
      : super(GoogleRegisterInitial());

  void logout() async {
    print("Doing a FB Logout");
    print(" Page : $page");
    emit(GoogleRegisterInterupt());
    await fb_service.logout();
    print("Did a FB Logout");

    reset();
  }

  void reset() {
    page = 1;
    emit(GoogleRegisterInitial());
    user_data = {
      "name": "",
      "gender": "",
      "number": "",
      "photoURL": "",
      "position": GeoPoint(0.0, 0.0),
      "age": 18,
      "invite_code": "",
    };
  }

  void registeruser() async {
    emit(RegisteringUser());
    String email = fb_service.get_user_email();
    bool status = await dataBaseService.adduser(
        user_data["name"],
        user_data["number"],
        user_data["gender"],
        user_data["photoURL"],
        email,
        user_data["position"],
        user_data["age"] as int,
        " ");
    if (status) {
      //This is just after registering so qttemptedques is false
      User user = User(
          age: user_data["age"] as int,
          name: user_data["name"],
          email: email,
          photoURL: user_data["photoURL"],
          number: user_data["number"],
          gender: user_data["gender"],
          attemptedques: false);
      emit(UserRegistered(user: user));
    } else {
      emit(UserRegisterError());
    }
  }
}
