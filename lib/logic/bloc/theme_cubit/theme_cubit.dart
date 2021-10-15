import 'package:bloc/bloc.dart';
import 'package:bloc_custom_firebase/theme.dart';
import 'package:flutter/material.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(DarkTheme(themeData: AppTheme.darkTheme));

  void changetheme(ThemeData theme) {
    if (state is LightTheme)
      emit(DarkTheme(themeData: AppTheme.darkTheme));
    else
      emit(LightTheme(themeData: AppTheme.lightTheme));
  }
}
