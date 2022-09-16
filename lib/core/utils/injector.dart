import 'dart:async';

import 'package:get_it/get_it.dart';
import 'package:sis_group6/domain/repositories/twitter_repository.dart';
import 'package:sis_group6/services/twitter.dart';

typedef AppRunner = void Function();

class Injector {
  static Future<void> init({required AppRunner appRunner}) async {
    await _initDependencies();
    appRunner();
  }

  static Future<void> _initDependencies() async {
    _injectUtils();
    _injectDatabase();
    _injectServices();
    _injectRepositories();
  }
}

/// Register utils and misc tools.
void _injectUtils() {}

void _injectDatabase() {}

void _injectRepositories() {
  GetIt.I.registerLazySingleton<TwitterRepository>(() {
    return TwitterRepositoryImpl();
  });
}

void _injectServices() {
  GetIt.I.registerLazySingleton<TwitterService>(() => TwitterService());
}
