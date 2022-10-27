import 'package:flutter/material.dart';
import 'package:sis_group6/core/consts/app.dart';
import 'package:routemaster/routemaster.dart';
import 'package:sis_group6/core/theme/app.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tabState = TabPage.of(context);
    return Drawer(
      backgroundColor: AppColors.secondaryColor,
      child: ListView(
        children: [
          DrawerHeader(
            child: Text(AppConsts.appName,
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(color: Colors.white)),
          ),
          _DrawerListTile(
            title: AppConsts.dashboard,
            press: () {
              tabState.controller.animateTo(0);
            },
            icon: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.dashboard_rounded, color: Colors.white),
            ),
          ),
          _DrawerListTile(
            title: AppConsts.notification,
            press: () {
              tabState.controller.animateTo(2);
            },
            icon: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.notifications, color: Colors.white),
            ),
          ),
          _DrawerListTile(
            title: AppConsts.profile,
            press: () {
              tabState.controller.animateTo(3);
            },
            icon: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.account_box, color: Colors.white),
            ),
          ),
          _DrawerListTile(
            title: AppConsts.settings,
            press: () {
              tabState.controller.animateTo(4);
            },
            icon: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.settings, color: Colors.white),
            ),
          ),
          _DrawerListTile(
            title: AppConsts.aboutUs,
            press: () {
              tabState.controller.animateTo(1);
            },
            icon: IconButton(
              onPressed: () {},
              icon:
                  const Icon(Icons.supervised_user_circle, color: Colors.white),
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
