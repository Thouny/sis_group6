import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingView extends StatelessWidget {
  final String message;

  const LoadingView({
    Key? key,
    this.message = 'Getting everything ready...',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SpinKitThreeInOut(color: Colors.white, size: 35),
            Text(message),
          ],
        ),
      ),
    );
  }
}
