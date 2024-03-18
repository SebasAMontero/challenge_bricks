import 'package:bricks_app_flutter/src/constants/colors.dart';
import 'package:bricks_app_flutter/src/data/datasources/city_data_source.dart';
import 'package:bricks_app_flutter/src/data/datasources/customer_data_source.dart';
import 'package:bricks_app_flutter/src/data/repositories/city_repository.dart';
import 'package:bricks_app_flutter/src/data/repositories/customer_repository.dart';
import 'package:bricks_app_flutter/src/presentation/bloc/bloc_general/bloc_general.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:bricks_app_flutter/src/core/routes/auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppView();
  }
}

/// {@template AppView}
/// General structure of the app, also initializes AutoRouter.
/// {@endtemplate}
class AppView extends StatefulWidget {
  /// {@macro AppView}
  const AppView({super.key});

  @override
  State<AppView> createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  late AppRouter appRouter;
  late CityRepository cityRepository;
  late CustomerRepository customerRepository;
  late CityDataSource cityDataSource;
  late CustomerDataSource customerDataSource;

  @override
  void initState() {
    super.initState();
    appRouter = AppRouter();
    cityDataSource = CityDataSource();
    customerDataSource = CustomerDataSource();

    customerRepository =
        CustomerRepository(customerDataSource: customerDataSource);
    cityRepository = CityRepository(cityDataSource: cityDataSource);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BlocGeneral(
        customerRepository: customerRepository,
        cityRepository: cityRepository,
      )..add(
          BlocGeneralEventInitialize(),
        ),
      child: MaterialApp.router(
        color: const Color.fromARGB(255, 183, 183, 183),
        routerDelegate: AutoRouterDelegate(
          appRouter,
        ),
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: BricksColors.themePurple,
          ),
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
        builder: (context, child) => ScrollConfiguration(
          behavior: NoGlowBehavior(),
          child: child!,
        ),
        routeInformationParser: appRouter.defaultRouteParser(),
      ),
    );
  }
}

/// {@template NoGlowBehavior}
/// It removes the effect of the blue wave in the ScrollViews.
/// {@endtemplate}
class NoGlowBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
    BuildContext context,
    Widget child,
    ScrollableDetails details,
  ) =>
      child;
}
