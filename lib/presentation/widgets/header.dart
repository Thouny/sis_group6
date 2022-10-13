import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sis_group6/bloc/sentiment_details/sentiment_details_bloc.dart';
import 'package:sis_group6/controller/menu_controller.dart';
import 'package:sis_group6/core/utils/responsive.dart';
import 'package:sis_group6/presentation/widgets/search_bar.dart';

class Header extends StatelessWidget {
  const Header({
    Key? key,
    required this.headerTitle,
    required this.isDashboard,
  }) : super(key: key);

  final String headerTitle;
  final bool isDashboard;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (!Responsive.isDesktop(context))
          IconButton(
            icon: const Icon(Icons.menu),
            onPressed: context.read<MenuController>().controlMenu,
          ),
        if (!Responsive.isMobile(context))
          Text(
            headerTitle,
            style: Theme.of(context).textTheme.headline6,
          ),
        if (!Responsive.isMobile(context))
          Spacer(flex: Responsive.isDesktop(context) ? 2 : 1),
        if (isDashboard)
          Expanded(
            child: SearchBar(
              onSubmitted: (value) {
                if (value.isNotEmpty) {
                  BlocProvider.of<SentimentDetailsBloc>(context).add(
                    GetSentimentDetailsEvent(query: value),
                  );
                }
              },
            ),
          )
      ],
    );
  }
}
