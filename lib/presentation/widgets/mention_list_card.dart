import 'package:flutter/material.dart';
import 'package:sis_group6/core/enums/sentiment.dart';
import 'package:sis_group6/core/enums/source.dart';
import 'package:sis_group6/core/theme/app.dart';
import 'package:sis_group6/domain/entities/mention.dart';

class MentionsListCard extends StatelessWidget {
  const MentionsListCard({super.key, required this.mentions});

  final List<MentionEntity> mentions;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppPaddingValues.xSmallHorizontalPadding),
      height: AppHeightValues.tweetsCardHeight,
      child: ListView.separated(
        primary: false,
        shrinkWrap: true,
        itemCount: mentions.length,
        itemBuilder: (context, index) {
          final currentMention = mentions[index];
          return ListTile(
            leading: currentMention.source.icon,
            title: SelectableText(currentMention.text),
            subtitle: SelectableText(
              currentMention.sentiment.label,
              style: Theme.of(context)
                  .textTheme
                  .caption
                  ?.copyWith(color: currentMention.sentiment.color),
            ),
          );
        },
        separatorBuilder: (context, indext) => const Divider(),
      ),
    );
  }
}
