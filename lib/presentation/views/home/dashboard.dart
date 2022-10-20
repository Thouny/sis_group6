import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sis_group6/bloc/sentiment_details/sentiment_details_bloc.dart';
import 'package:sis_group6/bloc/sentiment_over_time/sentiment_over_time_bloc.dart';
import 'package:sis_group6/bloc/sentiment_overview/sentiment_overview_bloc.dart';
import 'package:sis_group6/bloc/social_media/social_media_bloc.dart';
import 'package:sis_group6/core/consts/home/dashboard.dart';
import 'package:sis_group6/core/theme/app.dart';
import 'package:sis_group6/core/utils/responsive.dart';
import 'package:sis_group6/presentation/views/home/mentions_card.dart';
import 'package:sis_group6/presentation/widgets/header.dart';
import 'package:sis_group6/presentation/widgets/select_social_media.dart';
import 'package:sis_group6/presentation/widgets/sentiment_details.dart';
import 'package:sis_group6/presentation/widgets/sentiment_overview.dart';
import 'package:sis_group6/presentation/widgets/sentiment_over_time_graph.dart';
import 'package:sis_group6/presentation/widgets/word_cloud.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({Key? key}) : super(key: key);

  static const keyPrefix = 'DashboardView';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SocialMediaBloc, SocialMediaState>(
      builder: (context, state) {
        if (state is LoadedSociaMediaState) {
          return SingleChildScrollView(
            primary: false,
            padding: const EdgeInsets.all(AppPaddingValues.smallPadding),
            child: Column(
              children: [
                Header(
                  headerTitle: DashboardConsts.headerTitle,
                  isDashboard: true,
                  onSubmitted: (value) {
                    if (value.isNotEmpty) {
                      BlocProvider.of<SentimentDetailsBloc>(context).add(
                        GetSentimentDetailsEvent(
                          query: value,
                          selectedSocialMedia:
                              state.selectedSources.whereNotNull().toList(),
                        ),
                      );
                      BlocProvider.of<SentimentOverviewBloc>(context).add(
                        GetSentimentOverview(query: value),
                      );
                      BlocProvider.of<SentimentOverTimeBloc>(context).add(
                        GetSentimentFromLastSevenDaysEvent(query: value),
                      );
                    }
                  },
                ),
                const SizedBox(height: AppPaddingValues.smallPadding),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 5,
                      child: Column(
                        children: [
                          // TODO: Add more cards here
                          SelectSocialMediaWidget(
                            seletedSocialMedia: state.selectedSources,
                            socialMedia: state.socialMedia,
                          ),
                          if (Responsive.isMobile(context))
                            const SentimentDetails(),
                          if (Responsive.isMobile(context))
                            const SizedBox(
                                height: AppPaddingValues.smallPadding),
                          const SentimentOverTimeGraph(),
                          const SizedBox(height: AppPaddingValues.smallPadding),
                          const WordCloud(),
                          if (Responsive.isMobile(context))
                            const SizedBox(
                                height: AppPaddingValues.smallPadding),
                          if (Responsive.isMobile(context))
                            const SentimentOverview(),
                          const SizedBox(height: AppPaddingValues.smallPadding),
                          const MentionsCard(),
                        ],
                      ),
                    ),
                    if (!Responsive.isMobile(context))
                      const SizedBox(width: AppPaddingValues.smallPadding),
                    if (!Responsive.isMobile(context))
                      Flexible(
                        flex: 2,
                        child: Column(
                          children: const [
                            SentimentDetails(),
                            SizedBox(height: AppPaddingValues.smallPadding),
                            SentimentOverview(),
                          ],
                        ),
                      ),
                  ],
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
