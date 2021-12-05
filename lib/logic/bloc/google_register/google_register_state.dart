part of 'google_register_cubit.dart';

abstract class GoogleRegisterState  {
  int num;
  // Map<String, String> data;
  GoogleRegisterState({
    required this.num,
    // required this.data,
  });
}

class GoogleRegisterInitial extends GoogleRegisterState {
  GoogleRegisterInitial({required }) : super(num: 1);
}


class ImageRegister extends GoogleRegisterState {
  ImageRegister() : super(num: 4);
}

class RegisteringUser extends GoogleRegisterState {
  RegisteringUser() : super(num: 9);
}

class UserRegistered extends GoogleRegisterState {
  UserRegistered({required this.user}) : super(num: 10);
  User user;
}

//Error States

class UserRegisterError extends GoogleRegisterState {
  UserRegisterError() : super(num: -10);
}

class GoogleRegisterInterupt extends GoogleRegisterState {
  GoogleRegisterInterupt() : super(num: -1);
}
