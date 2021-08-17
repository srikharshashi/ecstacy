part of 'login_cubit.dart';

abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginFail extends LoginState {}

class LoginSucesss extends LoginState {
  // UserCredential userCredential;
  // LoginSucesss({required this.userCredential});
  // List<Object?> get props => [];
}

class UnAuthenticated extends LoginState {
  // List<Object?> get props => throw UnimplementedError();
}

class LoginLoad extends LoginState {}
