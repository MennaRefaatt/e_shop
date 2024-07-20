part of 'settings_cubit.dart';

@immutable
sealed class SettingsState {}

final class SettingsInitial extends SettingsState {}

class SettingsLoading extends SettingsState {}

class SettingsSuccess extends SettingsState {}

class SettingsError extends SettingsState {
  final String error;
  SettingsError(this.error);
}

class LogOutLoading extends SettingsState {}

class LogOutSuccess extends SettingsState {
  final LogOutModel logOutModel;
  LogOutSuccess({required this.logOutModel});}

class LogOutError extends SettingsState {
  final String error;
  LogOutError(this.error);
}


