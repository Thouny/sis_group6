import 'package:flutter/material.dart';
import 'package:sis_group6/core/settings/settings.dart';
import 'package:sis_group6/presentation/widgets/header.dart';
import 'package:sis_group6/core/theme/app.dart';

class SettingsInfoView extends StatelessWidget {
  const SettingsInfoView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      primary: false,
      padding: const EdgeInsets.all(AppPaddingValues.smallPadding),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Header(
            headerTitle: SettingsConsts.headerTitle,
            isDashboard: false,
          ),
          Text(SettingsConsts.message),
        ],
      ),
    );
  }
}
