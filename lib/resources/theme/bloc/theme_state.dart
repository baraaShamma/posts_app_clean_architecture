part of 'theme_bloc.dart';

abstract class ThemeState extends Equatable {
  const ThemeState(this.isDark);

  final bool isDark;

  @override
  List<Object> get props => [];
}
class ThemeInitial extends ThemeState {
  ThemeInitial(super.isDark);
}

class LoadedThemeState extends ThemeState {
  final ThemeData themeData;
  final bool isDark;

  const LoadedThemeState(this.isDark,{
  required this.themeData,
  }) : super(false);

  @override
  List<Object> get props => [isDark];
}
