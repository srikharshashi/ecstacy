part of 'google_register_cubit.dart';

abstract class GoogleRegisterState extends Equatable {
  const GoogleRegisterState();

  @override
  List<Object> get props => [];
}

class GoogleRegisterInitial extends GoogleRegisterState {}

class GoogleRegisterInterupt extends GoogleRegisterState{}
