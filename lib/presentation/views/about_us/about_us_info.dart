import 'package:flutter/material.dart';

class AboutUsInfoView extends StatelessWidget {
  final String message;

  const AboutUsInfoView({
    Key? key,
    this.message = 'About Us... To be edited',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(message),
          ],
        ),
      ),
    );
  }
}
