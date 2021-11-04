part of 'splashscreen_cubit.dart';

@immutable
abstract class SplashscreenState {}

class SplashscreenLoading extends SplashscreenState {}

class ConnectivityError extends SplashscreenState {}

class Loggedin extends SplashscreenState {
  User user;
  Loggedin({
    required this.user,
  });
}

class UnAuthenticated extends SplashscreenState {}
