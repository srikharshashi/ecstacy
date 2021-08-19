part of 'onboard_cubit.dart';

abstract class OnboardState extends Equatable {
  const OnboardState();

  @override
  List<Object> get props => [];
}

class OnboardInitial extends OnboardState {}

class OnboardLoad extends OnboardState{}

class OnboardError extends OnboardState{}

class OnboardHome extends OnboardState{}

class OnboardRegister extends OnboardState{}