import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sis_group6/bloc/preferences/preferences_bloc.dart';
import 'package:sis_group6/core/theme/app.dart';

class SentimentInfoCard extends StatelessWidget {
  const SentimentInfoCard({
    Key? key,
    required this.title,
    required this.icon,
    required this.percentage,
    required this.mentionsCount,
  }) : super(key: key);

  final String title;
  final String percentage;
  final Icon icon;
  final int mentionsCount;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PreferencesBloc, PreferencesState>(
      builder: (context, state) {
        if (state is LoadedPreferencesState) {
          return Container(
            margin: const EdgeInsets.only(top: AppPaddingValues.smallPadding),
            padding: const EdgeInsets.all(AppPaddingValues.smallPadding),
            decoration: BoxDecoration(
              border: Border.all(
                width: 2,
                color: AppColors.primaryColor.withOpacity(0.15),
              ),
              borderRadius: const BorderRadius.all(
                Radius.circular(AppPaddingValues.smallPadding),
              ),
            ),
            child: Row(
              children: [
                SizedBox(
                  height: 20,
                  width: 20,
                  child: icon,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: AppPaddingValues.smallPadding),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          "$mentionsCount mentions",
                          style: Theme.of(context).textTheme.caption!.copyWith(
                                color: state.isDarkMode
                                    ? Colors.white70
                                    : Colors.grey[500],
                              ),
                        ),
                      ],
                    ),
                  ),
                ),
                Text(percentage)
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
