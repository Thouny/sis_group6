import 'package:flutter/material.dart';
import 'package:sis_group6/presentation/pages/app.dart';
import 'package:sis_group6/presentation/views/notification/notification.dart';
import 'package:sis_group6/routing/initial_page_routes.dart';

class NotificationPage extends AppPage<void> {
  NotificationPage({
    String keyValue = InitialPageRoutes.notification,
    String routeName = InitialPageRoutes.notification,
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
          return const NotificationView();
        });
  }
}
