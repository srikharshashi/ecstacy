part of 'splashscreen_cubit.dart';

@immutable
abstract class SplashscreenState {}

class SplashscreenLoading extends SplashscreenState {}

class ConnectivityError extends SplashscreenState {}

class LoggedinQT extends SplashscreenState {
  User user;
  LoggedinQT({
    required this.user,
  });
}
class LoggedinQF extends SplashscreenState {
  User user;
  LoggedinQF({
    required this.user,
  });
}


class UnAuthenticated extends SplashscreenState {}
