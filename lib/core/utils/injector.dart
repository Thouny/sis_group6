import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:sis_group6/domain/repositories/sentiment.dart';
import 'package:sis_group6/infrastructure/network/client/app.dart';
import 'package:sis_group6/infrastructure/network/client/network.dart';
import 'package:sis_group6/services/open_ai.dart';
import 'package:sis_group6/services/sentiment.dart';

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
    _injectOpenAIService();
  }
}

/// Register utils and misc tools.
void _injectUtils() {
  GetIt.I.registerLazySingleton<NetworkClient>(() {
    return AppClient(Client(), ConnectivityService(Connectivity()));
  });
}

void _injectDatabase() {}

void _injectRepositories() {
  GetIt.I.registerLazySingleton<SentimentRepository>(() {
    return SentimentRepositoryImpl();
  });
}

void _injectServices() {
  GetIt.I.registerLazySingleton<SentimentService>(() => SentimentService());
}

void _injectOpenAIService() {
  GetIt.I.registerLazySingleton<OpenAIService>(() => OpenAIService());
}
