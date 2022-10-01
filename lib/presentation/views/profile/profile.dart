import 'package:flutter/material.dart';
import 'package:sis_group6/core/utils/responsive.dart';
import 'package:sis_group6/presentation/views/profile/profile_info.dart';
import 'package:sis_group6/presentation/widgets/profile_header.dart';
//import 'package:sis_group6/presentation/views/about_us/about_us_info.dart';
//import 'package:sis_group6/presentation/views/home/dashboard.dart';
//import 'package:sis_group6/presentation/views/loading.dart';
//import 'package:sis_group6/presentation/views/notification/notification_info.dart';
//import 'package:sis_group6/presentation/widgets/about_us_header.dart';
//import 'package:sis_group6/presentation/widgets/notification_header.dart';
import 'package:sis_group6/presentation/widgets/side_menu.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  static const keyPrefix = 'ProfileView';

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
          const Profile_Header(),
          const Expanded(
            // It takes 5/6 part of the screen
            flex: 5,
            child: ProfileInfoView(),
          ),
        ],
      ),
    );
  }
}
