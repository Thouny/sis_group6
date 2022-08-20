import 'package:routemaster/routemaster.dart';
import 'package:sis_group6/presentation/pages/home/home.dart';
import 'package:sis_group6/presentation/pages/loading.dart';
import 'package:sis_group6/presentation/root_page_tab_scaffold.dart';
import 'package:sis_group6/routing/routes.dart';

class PageRoutes {
  static final loading = RouteMap(
    routes: {
      Routes.loading: (_) => LoadingPage(),
    },
    onUnknownRoute: (_) => const Redirect(Routes.loading),
  );

  static final home = RouteMap(
    routes: {
      // `/`
      // Be mindful of ordering, must match expected bottom nav order
      Routes.root: (routeData) => const TabPage(
            child: RootPageTabScaffold(),
            paths: [
              Routes.home,
            ],
          ),

      /// **********************************************************************
      /// home
      /// **********************************************************************
      // `/home`
      Routes.home: (_) => HomePage(),
    },
  );
}
