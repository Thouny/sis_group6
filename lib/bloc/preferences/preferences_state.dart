part of 'preferences_bloc.dart';

abstract class PreferencesState extends Equatable {
  const PreferencesState();

  @override
  List<Object?> get props => [];
}

class InitialPreferencesState extends PreferencesState {
  const InitialPreferencesState();

  @override
  List<Object?> get props => [];
}

class LoadedPreferencesState extends PreferencesState {
  const LoadedPreferencesState({required this.isDarkMode});

  final bool isDarkMode;

  @override
  List<Object?> get props => [isDarkMode];
}
