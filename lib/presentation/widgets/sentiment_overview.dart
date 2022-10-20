import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:sis_group6/bloc/sentiment_overview/sentiment_overview_bloc.dart';
import 'package:sis_group6/core/consts/home/dashboard.dart';
import 'package:sis_group6/core/theme/app.dart';

class SentimentOverview extends StatelessWidget {
  const SentimentOverview({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SentimentOverviewBloc, SentimentOverviewState>(
      builder: (context, state) {
        if (state is LoadedSentimentOverviewState) {
          return _SentimentOverviewCard(
            children: [
              Flexible(
                child: SingleChildScrollView(
                  child: SelectableText(
                    state.sentimentOverview,
                    style: const TextStyle(
                      color: Colors.white70,
                      fontStyle: FontStyle.italic,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ],
          );
        } else if (state is LoadingSentimentOverviewState) {
          return const _SentimentOverviewCard(
            children: [
              Expanded(
                child: Center(
                  child: SpinKitThreeInOut(color: Colors.white, size: 35),
                ),
              ),
            ],
          );
        } else if (state is FailedSentimentOverviewState) {
          return _SentimentOverviewCard(
            children: [
              Expanded(
                child: Center(
                  child: Text(
                    state.message,
                    style: const TextStyle(
                      color: Colors.white70,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
              ),
            ],
          );
        } else {
          return const _SentimentOverviewCard(
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

class _SentimentOverviewCard extends StatelessWidget {
  const _SentimentOverviewCard({Key? key, required this.children})
      : super(key: key);

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      padding: const EdgeInsets.all(AppPaddingValues.smallPadding),
      decoration: const BoxDecoration(
        color: AppColors.secondaryColor,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const _CardTitle(),
          const SizedBox(height: AppPaddingValues.xSmallVerticalPadding),
          ...children
        ],
      ),
    );
  }
}

class _CardTitle extends StatelessWidget {
  const _CardTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      DashboardConsts.sentimentOverviewTitle,
      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
    );
  }
}
