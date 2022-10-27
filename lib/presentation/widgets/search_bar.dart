import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sis_group6/bloc/preferences/preferences_bloc.dart';
import 'package:sis_group6/core/theme/app.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({Key? key, required this.onSubmitted}) : super(key: key);

  final Function(String value)? onSubmitted;

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  final controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PreferencesBloc, PreferencesState>(
      builder: (context, state) {
        if (state is LoadedPreferencesState) {
          return TextField(
            controller: controller,
            onSubmitted: widget.onSubmitted,
            decoration: InputDecoration(
              hintText: "Search",
              fillColor:
                  state.isDarkMode ? AppColors.secondaryColor : Colors.grey[50],
              filled: true,
              border: const OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              suffixIcon: IconButton(
                icon: const Icon(Icons.clear),
                onPressed: controller.clear,
              ),
            ),
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
