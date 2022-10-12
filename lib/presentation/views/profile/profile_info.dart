import 'package:flutter/material.dart';
import 'package:sis_group6/core/consts/profile/profile.dart';
import 'package:sis_group6/presentation/widgets/header.dart';

class ProfileInfoView extends StatelessWidget {
  const ProfileInfoView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Header(
          headerTitle: ProfileConsts.headerTitle,
          isDashboard: false,
        ),
        Text(ProfileConsts.message),
      ],
    );
  }
}
