import 'package:flutter/material.dart';
import 'package:sis_group6/core/utils/responsive.dart';
import 'package:sis_group6/presentation/views/about_us/about_us_info.dart';
import 'package:sis_group6/presentation/widgets/side_menu.dart';
import 'package:sis_group6/presentation/widgets/header.dart';

class AboutUsView extends StatelessWidget {
  const AboutUsView({Key? key}) : super(key: key);

  static const keyPrefix = 'AboutUsView';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // We want this side menu only for large screen
          if (Responsive.isDesktop(context))
            const Expanded(
              // default flex = 1
              // and it takes 1/6 part of the screen
              child: SideMenu(),
            ),
          const Expanded(
            // It takes 5/6 part of the screen
            flex: 5,
            child: AboutUsInfoView(),
          ),
          const Header(headerTitle: 'About Us', isDashboard: false)
        ],
      ),
    );
  }
}
