import 'package:flutter/material.dart';
import 'package:sis_group6/core/consts/app.dart';
//import 'package:sis_group6/presentation/pages/about_us/about_us.dart';
//import 'package:sis_group6/presentation/pages/notification/notification.dart';
//import 'package:sis_group6/presentation/pages/home/home.dart';
//import 'package:sis_group6/presentation/widgets/search_bar.dart';
import 'package:routemaster/routemaster.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tabState = TabPage.of(context);
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
            child: Text(AppConsts.appName),
          ),
          _DrawerListTile(
            title: AppConsts.dashboard,
            press: () {
              tabState.controller.animateTo(0);
            },
            icon: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.dashboard_rounded),
            ),
          ),
          _DrawerListTile(
            title: AppConsts.notification,
            press: () {
              tabState.controller.animateTo(2);
            },
            icon: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.notifications),
            ),
          ),
          _DrawerListTile(
            title: AppConsts.profile,
            press: () {
              tabState.controller.animateTo(3);
            },
            icon: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.account_box),
            ),
          ),
          _DrawerListTile(
            title: AppConsts.settings,
            press: () {
              tabState.controller.animateTo(4);
            },
            icon: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.settings),
            ),
          ),
          _DrawerListTile(
            title: AppConsts.aboutUs,
            press: () {
              tabState.controller.animateTo(1);
            },
            icon: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.supervised_user_circle),
            ),
          ),
        ],
      ),
    );
  }
}

class _DrawerListTile extends StatelessWidget {
  const _DrawerListTile({
    Key? key,
    required this.title,
    required this.press,
    this.icon,
  }) : super(key: key);

  final String title;
  final IconButton? icon;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      horizontalTitleGap: 0.0,
      leading: icon,
      title: Text(
        title,
        style: const TextStyle(color: Colors.white54),
      ),
    );
  }
}
