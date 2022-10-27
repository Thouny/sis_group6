import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:sis_group6/bloc/preferences/preferences_bloc.dart';
import 'package:sis_group6/bloc/sentiment_details/sentiment_details_bloc.dart';
import 'package:sis_group6/core/consts/home/dashboard.dart';
import 'package:sis_group6/core/theme/app.dart';
import 'package:sis_group6/presentation/widgets/mention_list_card.dart';

class MentionsCard extends StatelessWidget {
  const MentionsCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PreferencesBloc, PreferencesState>(
      builder: (context, state) {
        if (state is LoadedPreferencesState) {
          return Container(
            padding: const EdgeInsets.all(AppPaddingValues.smallPadding),
            decoration: BoxDecoration(
              color:
                  state.isDarkMode ? AppColors.secondaryColor : Colors.grey[50],
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      DashboardConsts.mentionsCardTitle,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                    IconButton(
                      tooltip: DashboardConsts.mentionsTooTip,
                      onPressed: () {},
                      icon: const Icon(Icons.info),
                    ),
                  ],
                ),
                SizedBox(
                  width: double.infinity,
                  child: _MentionsContent(isDarkMode: state.isDarkMode),
                ),
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

class _MentionsContent extends StatelessWidget {
  const _MentionsContent({this.isDarkMode = false});

  final bool isDarkMode;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppHeightValues.tweetsCardHeight,
      child: BlocBuilder<SentimentDetailsBloc, SentimentDetailsState>(
        builder: (context, state) {
          if (state is LoadedSentimentDetailsState) {
            return MentionsListCard(mentions: state.mentions);
          } else if (state is LoadingSentimentDetailsState) {
            return Expanded(
              child: Center(
                child: SpinKitThreeInOut(
                  color: isDarkMode ? Colors.white : AppColors.secondaryColor,
                  size: 35,
                ),
              ),
            );
          } else if (state is FailedSentimentDetailsState) {
            return Text(state.message);
          } else {
            return SizedBox.expand(
              child: Center(
                child: Text(
                  DashboardConsts.emptyCardText,
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                        fontStyle: FontStyle.italic,
                      ),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
