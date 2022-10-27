import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:sis_group6/bloc/preferences/preferences_bloc.dart';
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
                  primary: false,
                  child: SelectableText(
                    state.sentimentOverview,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          // color: Colors.white70,
                          fontStyle: FontStyle.italic,
                          fontSize: 16,
                        ),
                  ),
                ),
              ),
            ],
          );
        } else if (state is LoadingSentimentOverviewState) {
          return BlocBuilder<PreferencesBloc, PreferencesState>(
            builder: (context, state) {
              if (state is LoadedPreferencesState) {
                return _SentimentOverviewCard(
                  children: [
                    Expanded(
                      child: Center(
                        child: SpinKitThreeInOut(
                          color: state.isDarkMode
                              ? Colors.white
                              : AppColors.secondaryColor,
                          size: 35,
                        ),
                      ),
                    ),
                  ],
                );
              } else {
                return const SizedBox.shrink();
              }
            },
          );
        } else if (state is FailedSentimentOverviewState) {
          return _SentimentOverviewCard(
            children: [
              Expanded(
                child: Center(
                  child: BlocBuilder<PreferencesBloc, PreferencesState>(
                    builder: (context, prefState) {
                      if (prefState is LoadedPreferencesState) {
                        return Text(
                          state.message,
                          style:
                              Theme.of(context).textTheme.bodyText1?.copyWith(
                                    fontStyle: FontStyle.italic,
                                  ),
                        );
                      } else {
                        return const SizedBox.shrink();
                      }
                    },
                  ),
                ),
              ),
            ],
          );
        } else {
          return _SentimentOverviewCard(
            children: [
              Expanded(
                child: Center(
                  child: Text(
                    DashboardConsts.emptyCardText,
                    style: Theme.of(context).textTheme.labelMedium?.copyWith(
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
    return BlocBuilder<PreferencesBloc, PreferencesState>(
      builder: (context, state) {
        if (state is LoadedPreferencesState) {
          return Container(
            height: 400,
            padding: const EdgeInsets.all(AppPaddingValues.smallPadding),
            decoration: BoxDecoration(
              color:
                  state.isDarkMode ? AppColors.secondaryColor : Colors.grey[50],
              borderRadius: const BorderRadius.all(Radius.circular(10)),
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
        } else {
          return const SizedBox.shrink();
        }
      },
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
