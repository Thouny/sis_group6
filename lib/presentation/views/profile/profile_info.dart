import 'package:flutter/material.dart';

class ProfileInfoView extends StatelessWidget {
  final String message;

  const ProfileInfoView({Key? key, this.message = '\n \n \n Blank'})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: Center(
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(message),
        ],
        //  ),
      ),
    );
  }
}
