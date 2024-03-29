part of 'authstatus_cubit.dart';

abstract class AuthstatusState extends Equatable {

  @override
  List<Object> get props => [];
}

class Unautheticated extends AuthstatusState {
}

class Authenticated extends AuthstatusState {
  User user;
  Authenticated({
    required this.user,
  });
}
