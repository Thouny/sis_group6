import 'package:flutter/material.dart';

class SettingsInfoView extends StatelessWidget {
  final String message;

  const SettingsInfoView({Key? key, this.message = '\n \n \n Blank'})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(message),
        ],
    );
  }
}
