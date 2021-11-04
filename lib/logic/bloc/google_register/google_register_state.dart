part of 'google_register_cubit.dart';

abstract class GoogleRegisterState extends Equatable {
  int num;
  GoogleRegisterState({
    required this.num,
  });
  @override
  List<Object> get props => [num];
}

class GoogleRegisterInitial extends GoogleRegisterState {
  GoogleRegisterInitial() : super(num: 1);
}

class NumberRegister extends GoogleRegisterState {
  NumberRegister() : super(num: 2);
}

class GenderRegister extends GoogleRegisterState {
  GenderRegister() : super(num: 3);
}

class BioRegister extends GoogleRegisterState {
  BioRegister() : super(num: 4);
}

class ImageRegister extends GoogleRegisterState {
  ImageRegister() : super(num: 5);
}

class LocationRegister extends GoogleRegisterState {
  LocationRegister() : super(num: 6);
}

class GetInvite extends GoogleRegisterState {
  GetInvite({required this.invite_contoller}) : super(num: 7);
  TextEditingController invite_contoller;
} //

class GetInviteLoad extends GoogleRegisterState {
  GetInviteLoad() : super(num: 8);
} //

class Invitevalid extends GoogleRegisterState {
  Invitevalid() : super(num: 9);
} //

class RegisteringUser extends GoogleRegisterState {
  RegisteringUser() : super(num: 10);
}

class UserRegistered extends GoogleRegisterState {
  UserRegistered({required this.user}) : super(num: 11);
  User user;
}

//Error States

class UserRegisterError extends GoogleRegisterState {
  UserRegisterError() : super(num: -10);
}

class Inviteinvalid extends GoogleRegisterState {
  Inviteinvalid() : super(num: -7);
} //

class GoogleRegisterInterupt extends GoogleRegisterState {
  GoogleRegisterInterupt() : super(num: -1);
}
