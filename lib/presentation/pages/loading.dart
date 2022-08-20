import 'package:flutter/material.dart';
import 'package:sis_group6/presentation/pages/app.dart';
import 'package:sis_group6/presentation/views/loading.dart';
import 'package:sis_group6/routing/initial_page_routes.dart';

class LoadingPage extends AppPage<void> {
  LoadingPage()
      : super(
          keyValue: InitialPageRoutes.loading,
          routeName: InitialPageRoutes.loading,
        );

  @override
  Route<void> createRoute(BuildContext context) {
    return MaterialPageRoute(
      settings: this,
      builder: (context) => const LoadingView(),
    );
  }
}
