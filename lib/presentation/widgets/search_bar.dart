import 'package:flutter/material.dart';
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
    return TextField(
      controller: controller,
      onSubmitted: widget.onSubmitted,
      decoration: InputDecoration(
        hintText: "Search",
        fillColor: AppColors.secondaryColor,
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
  }
}
