import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:sis_group6/bloc/sentiment/sentiment_bloc.dart';
import 'package:sis_group6/core/consts/home/dashboard.dart';
import 'package:sis_group6/core/theme/app.dart';

class SentimentDetails extends StatelessWidget {
  const SentimentDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SentimentBloc, SentimentState>(
      builder: (context, state) {
        if (state is LoadedSentimentState) {
          return _SentimentCard(
            children: [
              Flexible(
                child: SingleChildScrollView(
                  child: Text(
                    state.sentimentOverview,
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ],
          );
        } else if (state is LoadingSentimentState) {
          return const _SentimentCard(
            children: [
              Expanded(
                child: Center(
                  child: SpinKitThreeInOut(color: Colors.white, size: 35),
                ),
              ),
            ],
          );
        } else if (state is FailedSentimentState) {
          return _SentimentCard(
            children: [
              Expanded(child: Center(child: Text(state.message))),
            ],
          );
        } else {
          return const _SentimentCard(
            children: [
              Expanded(
                child: Center(
                  child: Text(
                    DashboardConsts.emptyCardText,
                    style: TextStyle(
                      color: Colors.white70,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
              ),
            ],
          );
        }
      },
    );
  }
}

class _SentimentCard extends StatelessWidget {
  const _SentimentCard({Key? key, required this.children}) : super(key: key);

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      padding: const EdgeInsets.all(AppPaddingValues.smallPadding),
      decoration: const BoxDecoration(
        color: AppColors.secondaryColor,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [const _CardTitle(), ...children],
      ),
    );
  }
}

class _CardTitle extends StatelessWidget {
  const _CardTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      DashboardConsts.sentimentChartTitle,
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
