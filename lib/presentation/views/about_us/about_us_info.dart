import 'package:flutter/material.dart';
import 'package:sis_group6/core/consts/about_us/about_us.dart';
import 'package:sis_group6/core/consts/home/dashboard.dart';
import 'package:sis_group6/presentation/widgets/header.dart';

class AboutUsInfoView extends StatelessWidget {
  const AboutUsInfoView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Header(
          headerTitle: AboutUsConsts.headerTitle,
          isDashboard: false,
        ),
        Text(AboutUsConsts.message),
      ],
    );
  }
}
