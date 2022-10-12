import 'package:flutter/material.dart';
import 'package:sis_group6/core/settings/settings.dart';
import 'package:sis_group6/presentation/widgets/header.dart';

class SettingsInfoView extends StatelessWidget {
  const SettingsInfoView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Header(
          headerTitle: SettingsConsts.headerTitle,
          isDashboard: false,
        ),
        Text(SettingsConsts.message),
      ],
    );
  }
}
