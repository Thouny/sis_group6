import 'package:flutter/material.dart';
import 'package:sis_group6/core/consts/about_us/about_us.dart';

class AboutUsInfoView extends StatelessWidget {
  final String message;

  const AboutUsInfoView({
    Key? key,
    this.message = //AboutUsConsts.message
        '\n \n \n \n \n \n \n \n       Founded in 2022, Sentimently uses AI-powered semantic technology to accurately model sentiment analysis, \n       text analytics, and enterprise search solutions that are a fit for you - whether you are a small \n       or medium-sized business, or a larger enterprise. \n \n       Every solution is unique to each client. We provide customized training of machine-learned NLP \n       models specifically catered to each client\'s exclusive domain, products, and entities. ',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
        return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(message),
         // Text(AboutUsConsts.headerTitle)
        ],
      );
  }
}
