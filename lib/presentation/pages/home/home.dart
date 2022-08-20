import 'package:flutter/material.dart';
import 'package:sis_group6/presentation/pages/app.dart';
import 'package:sis_group6/presentation/views/home/home.dart';
import 'package:sis_group6/routing/initial_page_routes.dart';

class HomePage extends AppPage<void> {
  HomePage({
    String keyValue = InitialPageRoutes.home,
    String routeName = InitialPageRoutes.home,
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
          return const HomeView();
        });
  }
}
