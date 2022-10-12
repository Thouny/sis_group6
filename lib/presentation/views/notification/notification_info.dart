import 'package:flutter/material.dart';
import 'package:sis_group6/core/consts/notification/notification.dart';
import 'package:sis_group6/presentation/widgets/header.dart';

class NotificationInfoView extends StatelessWidget {
  const NotificationInfoView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Header(
          headerTitle: NotificationConsts.headerTitle,
          isDashboard: false,
        ),
        Text(NotificationConsts.message),
      ],
    );
  }
}
