part of 'google_register_cubit.dart';

abstract class GoogleRegisterState extends Equatable {
  const GoogleRegisterState();

  @override
  List<Object> get props => [];
}

class GoogleRegisterInitial extends GoogleRegisterState {}

class GoogleRegisterInterupt extends GoogleRegisterState{}

class NumberRegister extends GoogleRegisterState{}

class GenderRegister extends GoogleRegisterState{}

class BioRegister extends GoogleRegisterState{}

class ImageRegister extends GoogleRegisterState{}

class LocationRegister extends GoogleRegisterState{}

class Register6Done extends GoogleRegisterState{}
