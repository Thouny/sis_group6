import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:routemaster/routemaster.dart';
import 'package:sis_group6/bloc/app/app_bloc.dart';
import 'package:sis_group6/controller/menu_controller.dart';
import 'package:sis_group6/core/consts/app.dart';
import 'package:sis_group6/core/theme/app.dart';
import 'package:sis_group6/core/utils/injector.dart';
import 'package:sis_group6/routing/page_routes.dart';

Future<void> initApp() async {
  await Injector.init(appRunner: () {
    runApp(const AppWrapper());
  });
}

class AppWrapper extends StatelessWidget {
  const AppWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => MenuController(),
        ),
      ],
      child: BlocProvider(
        create: (context) => AppBloc()..add(const CheckAppStateEvent()),
        child: const App(),
      ),
    );
  }
}

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  late final RoutemasterDelegate routemaster;

  @override
  void initState() {
    routemaster = RoutemasterDelegate(
      routesBuilder: (context) {
        final state = BlocProvider.of<AppBloc>(context).state;
        if (state is AppHomeState) {
          return PageRoutes.home;
        } else {
          return PageRoutes.loading;
        }
      },
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(
      bloc: BlocProvider.of<AppBloc>(context),
      buildWhen: (previous, current) => previous != current,
      builder: (context, state) {
        return MaterialApp.router(
          key: ObjectKey(state),
          title: AppConsts.appName,
          theme: ThemeData.dark().copyWith(
            scaffoldBackgroundColor: AppColors.backgroundColor,
            textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
                .apply(bodyColor: Colors.white),
            canvasColor: AppColors.secondaryColor,
          ),
          routeInformationParser: const RoutemasterParser(),
          routerDelegate: routemaster,
          builder: (context, child) => MediaQuery(
            // override OS-level font scaling
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            child: child ?? const SizedBox.shrink(),
          ),
        );
      },
    );
  }
}
