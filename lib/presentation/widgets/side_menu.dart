import 'package:flutter/material.dart';
import 'package:sis_group6/core/consts/app.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
            child: Text(AppConsts.appName),
          ),
          _DrawerListTile(
            title: AppConsts.dashboard,
            press: () {},
            icon: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.dashboard_rounded),
            ),
          ),
          _DrawerListTile(
            title: AppConsts.notification,
            press: () {},
            icon: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.notifications),
            ),
          ),
          _DrawerListTile(
            title: AppConsts.profile,
            press: () {},
            icon: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.account_box),
            ),
          ),
          _DrawerListTile(
            title: AppConsts.settings,
            press: () {},
            icon: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.settings),
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
