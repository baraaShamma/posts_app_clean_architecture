import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../app_theme.dart';
import '../theme_cache_helper.dart';

part 'theme_event.dart';

part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeInitial(false)) {
    on<ThemeEvent>((event, emit) async {
      if (event is GetCurrentThemeEvent) {
        final themeIndex = await ThemeCacheHelper().getCachedTheme();

        if (themeIndex == true) {
          final theme =
              AppTheme.values.firstWhere((appTheme) => appTheme.index == 1);
          emit(LoadedThemeState(themeIndex, themeData: appThemeData[theme]!));
        } else {
          final theme =
              AppTheme.values.firstWhere((appTheme) => appTheme.index == 0);
          emit(LoadedThemeState(themeIndex, themeData: appThemeData[theme]!));
        }
      } else if (event is ThemeChangedEvent) {
        bool themeIndex = event.theme;
        await ThemeCacheHelper().cacheThemeIndex(themeIndex);
        if (themeIndex == true) {
          final theme =
              AppTheme.values.firstWhere((appTheme) => appTheme.index == 1);
          emit(LoadedThemeState(themeIndex, themeData: appThemeData[theme]!));
        } else {
          final theme =
              AppTheme.values.firstWhere((appTheme) => appTheme.index == 0);
          emit(LoadedThemeState(themeIndex, themeData: appThemeData[theme]!));
        }
      }
    });
  }
}
