part of 'logout_cubit.dart';

@immutable
abstract class LogoutState {}

class LogoutInitial extends LogoutState {}

class LogOutSucess extends LogoutState{}

class LogOutFailed extends LogoutState{}
