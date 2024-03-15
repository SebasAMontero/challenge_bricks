import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:weather_app_flutter/src/presentation/bloc/bloc_login.dart';
import 'package:weather_app_flutter/src/presentation/views/home_view.dart';

/// {@template CustomerFormPage}
/// Home page.
/// {@endtemplate}
@RoutePage()
class CustomerFormPage extends StatelessWidget {
  /// {@macro CustomerFormPage}
  const CustomerFormPage({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider<BlocHome>(
      create: (context) => BlocHome(),
      child: const Scaffold(
        body: HomeView(),
      ),
    );
  }
}
