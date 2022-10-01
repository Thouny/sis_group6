import 'package:flutter/material.dart';

class NotificationInfoView extends StatelessWidget {
  final String message;

  const NotificationInfoView({Key? key, this.message = '\n \n \n blank'})
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
