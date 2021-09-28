part of 'theme_cubit.dart';

abstract class ThemeState {
  final ThemeData themeData;
  ThemeState({required this.themeData});
}

class LightTheme extends ThemeState {
  LightTheme({required ThemeData themeData}) : super(themeData: themeData);
}

class DarkTheme extends ThemeState {
  DarkTheme({required ThemeData themeData}) : super(themeData: themeData);
}
