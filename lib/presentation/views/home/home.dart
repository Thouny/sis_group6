import 'package:flutter/material.dart';
import 'package:sis_group6/core/consts/home/home.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Text(HomeConsts.title),
          ],
        ),
      ),
    );
  }
}
