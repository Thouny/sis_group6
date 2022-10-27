import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sis_group6/core/consts/storage_keys.dart';

part 'preferences_event.dart';
part 'preferences_state.dart';

class PreferencesBloc extends Bloc<PreferencesEvent, PreferencesState> {
  PreferencesBloc() : super(const InitialPreferencesState()) {
    on<LoadPreferencesEvent>(_onLoadPreferences);
    on<SwitchThemeModeEvent>(_onSwitchThemeMode);
  }

  FutureOr<void> _onLoadPreferences(
    LoadPreferencesEvent event,
    Emitter<PreferencesState> emit,
  ) async {
    final storage = await SharedPreferences.getInstance();
    final isDarkMode = storage.getBool(StorageKeys.isDarkMode) ?? true;
    emit(LoadedPreferencesState(isDarkMode: isDarkMode));
  }

  FutureOr<void> _onSwitchThemeMode(
    SwitchThemeModeEvent event,
    Emitter<PreferencesState> emit,
  ) async {
    final storage = await SharedPreferences.getInstance();
    final isDarkMode = storage.getBool(StorageKeys.isDarkMode) ?? true;
    await storage.setBool(StorageKeys.isDarkMode, !isDarkMode);
    emit(LoadedPreferencesState(isDarkMode: !isDarkMode));
  }
}
