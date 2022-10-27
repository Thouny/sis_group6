import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sis_group6/bloc/preferences/preferences_bloc.dart';
import 'package:sis_group6/core/settings/settings.dart';
import 'package:sis_group6/presentation/widgets/header.dart';
import 'package:sis_group6/core/theme/app.dart';

class SettingsInfoView extends StatelessWidget {
  const SettingsInfoView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      primary: false,
      padding: const EdgeInsets.all(AppPaddingValues.smallPadding),
      child: BlocBuilder<PreferencesBloc, PreferencesState>(
        builder: (context, state) {
          final bloc = BlocProvider.of<PreferencesBloc>(context);
          if (state is LoadedPreferencesState) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Header(
                  headerTitle: SettingsConsts.headerTitle,
                  isDashboard: false,
                ),
                const SizedBox(height: AppPaddingValues.mediumPadding),
                Row(
                  children: [
                    Text(
                      'Appearance',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const SizedBox(width: AppWidthValues.collectionCardWidth),
                    CupertinoSwitch(
                      value: state.isDarkMode,
                      onChanged: (_) => bloc.add(const SwitchThemeModeEvent()),
                    ),
                  ],
                ),
              ],
            );
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
