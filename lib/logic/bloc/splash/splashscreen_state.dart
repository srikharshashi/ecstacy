part of 'splashscreen_cubit.dart';

@immutable
abstract class SplashscreenState {}

class SplashscreenLoading extends SplashscreenState {}

class ConnectivityError extends SplashscreenState {}

class Loggedin extends SplashscreenState {}

class UnAuthenticated extends SplashscreenState {}
