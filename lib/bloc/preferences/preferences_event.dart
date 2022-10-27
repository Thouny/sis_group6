part of 'preferences_bloc.dart';

abstract class PreferencesEvent extends Equatable {
  const PreferencesEvent();

  @override
  List<Object?> get props => [];
}

class LoadPreferencesEvent extends PreferencesEvent {
  const LoadPreferencesEvent();

  @override
  List<Object?> get props => [];
}

class SwitchThemeModeEvent extends PreferencesEvent {
  const SwitchThemeModeEvent();

  @override
  List<Object?> get props => [];
}
