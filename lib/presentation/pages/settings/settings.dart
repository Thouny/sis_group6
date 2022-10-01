import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sis_group6/bloc/tweets/tweets_bloc.dart';
import 'package:sis_group6/presentation/pages/app.dart';
import 'package:sis_group6/presentation/views/settings/settings.dart';
import 'package:sis_group6/presentation/views/home/home.dart'; //unused import, remove?
import 'package:sis_group6/routing/initial_page_routes.dart';

class SettingsPage extends AppPage<void> {
  SettingsPage({
    String keyValue = InitialPageRoutes.settings,
    String routeName = InitialPageRoutes.settings,
    Map<String, dynamic> arguments = const <String, dynamic>{},
  }) : super(
          keyValue: keyValue,
          routeName: routeName,
          arguments: arguments,
        );

  @override
  Route<void> createRoute(BuildContext context) {
    return MaterialPageRoute(
        settings: this,
        builder: (context) {
          return BlocProvider(
            create: (context) => TweetsBloc(),
            child: const SettingView(),
          );
        });
  }
}
