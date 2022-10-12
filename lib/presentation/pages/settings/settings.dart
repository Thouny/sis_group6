import 'package:flutter/material.dart';
import 'package:sis_group6/presentation/pages/app.dart';
import 'package:sis_group6/presentation/views/settings/settings.dart';
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
          return const SettingView();
        });
  }
}
