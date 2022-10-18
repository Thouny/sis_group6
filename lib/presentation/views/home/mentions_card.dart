import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:sis_group6/bloc/sentiment_details/sentiment_details_bloc.dart';
import 'package:sis_group6/core/consts/home/dashboard.dart';
import 'package:sis_group6/core/theme/app.dart';
import 'package:sis_group6/presentation/widgets/mention_list_card.dart';

class MentionsCard extends StatelessWidget {
  const MentionsCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppPaddingValues.smallPadding),
      decoration: const BoxDecoration(
        color: AppColors.secondaryColor,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            DashboardConsts.mentionsCardTitle,
            style: Theme.of(context).textTheme.subtitle1,
          ),
          const SizedBox(
            width: double.infinity,
            child: _MentionsContent(),
          ),
        ],
      ),
    );
  }
}

class _MentionsContent extends StatelessWidget {
  const _MentionsContent();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppHeightValues.tweetsCardHeight,
      child: BlocBuilder<SentimentDetailsBloc, SentimentDetailsState>(
        builder: (context, state) {
          if (state is LoadedSentimentDetailsState) {
            return MentionsListCard(mentions: state.mentions);
          } else if (state is LoadingSentimentDetailsState) {
            return const Expanded(
              child: Center(
                child: SpinKitThreeInOut(color: Colors.white, size: 35),
              ),
            );
          } else if (state is FailedSentimentDetailsState) {
            return Text(state.message);
          }
          return const SizedBox.expand(
            child: Center(
              child: Text(
                DashboardConsts.emptyCardText,
                style: TextStyle(
                  color: Colors.white70,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
