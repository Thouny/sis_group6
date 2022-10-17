import 'package:flutter/material.dart';
import 'package:sis_group6/presentation/pages/app.dart';
import 'package:sis_group6/presentation/views/about_us/about_us.dart';
import 'package:sis_group6/routing/initial_page_routes.dart';

class AboutUsPage extends AppPage<void> {
  AboutUsPage({
    String keyValue = InitialPageRoutes.aboutUs,
    String routeName = InitialPageRoutes.aboutUs,
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
          return const AboutUsView();
        });
  }
}
