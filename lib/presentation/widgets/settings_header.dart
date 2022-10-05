import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
//import 'package:sis_group6/bloc/tweets/tweets_bloc.dart';
import 'package:sis_group6/controller/menu_controller.dart';
import 'package:sis_group6/core/settings/settings.dart';
import 'package:sis_group6/core/utils/responsive.dart';
// import 'package:sis_group6/presentation/widgets/search_bar.dart';

class Settings_Header extends StatelessWidget {
  const Settings_Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   // final bloc = BlocProvider.of<TweetsBloc>(context);
    return Row(
      children: [
        if (!Responsive.isDesktop(context))
          IconButton(
            icon: const Icon(Icons.menu),
            onPressed: context.read<MenuController>().controlMenu,
          ),
        if (!Responsive.isMobile(context))
          Text(
            SettingsConsts.headerTitle,
            style: Theme.of(context).textTheme.headline6,
          ),
      ],
    );
  }
}
