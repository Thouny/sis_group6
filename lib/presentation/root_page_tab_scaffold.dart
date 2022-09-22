import 'package:flutter/material.dart';
import 'package:routemaster/routemaster.dart';

class RootPageTabScaffold extends StatefulWidget {
  const RootPageTabScaffold({Key? key}) : super(key: key);

  @override
  State<RootPageTabScaffold> createState() => _RootPageTabScaffoldState();
}

class _RootPageTabScaffoldState extends State<RootPageTabScaffold>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
    );
    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    final tabState = TabPage.of(context);
    final currentPath = Routemaster.of(context).currentRoute.fullPath;

    return Scaffold(
      appBar: _buildAppBar(context, currentPath),
      body: HeroControllerScope(
        controller: MaterialApp.createMaterialHeroController(),
        child: PageStackNavigator(
          key: ValueKey(currentPath),
          stack: tabState.stacks[tabState.index],
        ),
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context, String currentPath) {
    return AppBar(
      // title: _SearchBar(onSubmitted: (value) {}, onClear: () {}),  //needa put this under the appbar somehow
      //icons i need: icon.output, icon.add_sharp, and icon.help_center_outlined

      backgroundColor: Colors.blue.shade900,
      automaticallyImplyLeading: false,
      elevation: 5.0,
      leading: IconButton(
        onPressed: () {},
        icon: const Icon(Icons.menu),
      ),
      // flexibleSpace: _SearchBar(onSubmitted: (value) {}, onClear: () {}),
      title: Text("Dashboard"),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 16),
          child: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.settings),
          ),
        ),
      ],
    );
  }
}

class _SearchBar extends StatelessWidget {
  const _SearchBar({required this.onSubmitted, required this.onClear});

  final Function(String)? onSubmitted;
  final VoidCallback? onClear;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 40,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
      ),
      child: TextField(
        onSubmitted: onSubmitted,
        decoration: InputDecoration(
            prefixIcon: const Icon(Icons.search),
            suffixIcon: IconButton(
              icon: const Icon(Icons.clear),
              onPressed: onClear,
            ),
            hintText: 'Search...',
            border: InputBorder.none),
      ),
    );
  }
}
