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
      elevation: 0,
      leading: Padding(
        padding: const EdgeInsets.all(8),
        child: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.account_circle),
        ),
      ),
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
