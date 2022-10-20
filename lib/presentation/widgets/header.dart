import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sis_group6/controller/menu_controller.dart';
import 'package:sis_group6/core/utils/responsive.dart';
import 'package:sis_group6/presentation/widgets/search_bar.dart';

class Header extends StatelessWidget {
  const Header({
    Key? key,
    required this.headerTitle,
    required this.isDashboard,
    this.onSubmitted,
  }) : super(key: key);

  final String headerTitle;
  final bool isDashboard;
  final Function(String value)? onSubmitted;

  static const _dropdownvalue = 'Last 7 days';

// List of items in our dropdown menu
  static const _dropDownItems = [
    'Last 7 days',
    'Last 2 weeks',
    'Last month',
    'Last 3 months',
    'Last 6 months',
    'Last year'
  ];

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
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: DropdownButton(
              value: _dropdownvalue,
              icon: const Icon(Icons.keyboard_arrow_down),
              items: _dropDownItems.map((String item) {
                return DropdownMenuItem(
                  value: item,
                  child: Text(item),
                );
              }).toList(),
              onChanged: (String? newValue) {
                // setState(() {
                //   dropdownvalue = newValue!;
                // });
              },
            ),
          ),
        if (isDashboard)
          Expanded(
            child: SearchBar(onSubmitted: onSubmitted),
          ),
      ],
    );
  }
}
