import 'package:auto_route/auto_route.dart';
import 'package:bricks_app_flutter/src/constants/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bricks_app_flutter/src/presentation/bloc/bloc_home/bloc_home.dart';
import 'package:bricks_app_flutter/src/presentation/views/home_view.dart';
import 'package:bricks_app_flutter/src/presentation/widgets/bricks_app_bar.dart';

/// {@template HomePage}
/// Home page.
/// {@endtemplate}
@RoutePage()
class HomePage extends StatelessWidget {
  /// {@macro HomePage}
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider<BlocHome>(
      create: (context) => BlocHome()
        ..add(
          const BlocHomeEventInitialize(),
        ),
      child: const Scaffold(
        appBar: BricksAppBar(
          title: Strings.homePageAppBarTitle,
        ),
        body: HomeView(),
        backgroundColor: Color.fromARGB(237, 241, 240, 240),
      ),
    );
  }
}
