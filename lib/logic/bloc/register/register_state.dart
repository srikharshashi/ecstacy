part of 'register_cubit.dart';

@immutable
abstract class RegisterState {}

class RegisterInitial extends RegisterState {}

class RegisterLoad extends RegisterState {}

class RegisterSuccess extends RegisterState {}

class RegisterFail extends RegisterState {}
