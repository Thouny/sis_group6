import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:sis_group6/bloc/social_media/social_media_bloc.dart';
import 'package:sis_group6/core/enums/source.dart';
import 'package:sis_group6/core/theme/app.dart';
import 'package:sis_group6/presentation/models/social_media.dart';

class SelectSocialMediaWidget extends StatelessWidget {
  const SelectSocialMediaWidget({
    Key? key,
    required this.seletedSocialMedia,
    required this.socialMedia,
  }) : super(key: key);

  final List<SocialMediaModel?> seletedSocialMedia;
  final List<SocialMediaModel?> socialMedia;

  @override
  Widget build(BuildContext context) {
    final socialMediaBloc = BlocProvider.of<SocialMediaBloc>(context);
    return MultiSelectChipField<SocialMediaModel?>(
      height: AppHeightValues.multiChipFieldHeight,
      showHeader: false,
      initialValue: seletedSocialMedia,
      selectedChipColor: Colors.green.withOpacity(0.5),
      items: socialMedia
          .map((e) => MultiSelectItem(e, e?.source.label ?? ''))
          .toList(),
      icon: const Icon(Icons.check),
      onTap: (values) {
        socialMediaBloc.add(SelectSocialMediaEvent(values));
      },
    );
  }
}
