import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bricks_app_flutter/src/data/datasources/city_data_source.dart';
import 'package:bricks_app_flutter/src/data/datasources/customer_data_source.dart';
import 'package:bricks_app_flutter/src/data/repositories/city_repository.dart';
import 'package:bricks_app_flutter/src/data/repositories/customer_repository.dart';
import 'package:flutter/material.dart';

import 'dart:developer';

import 'package:flutter/widgets.dart';

class AppBlocObserver extends BlocObserver {
  const AppBlocObserver();

  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    log('onChange(${bloc.runtimeType}, $change)');
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    log('onError(${bloc.runtimeType}, $error, $stackTrace)');
    super.onError(bloc, error, stackTrace);
  }
}

Future<void> bootstrap(
  FutureOr<Widget> Function() builder, {
  String? hostUrl,
  String? entorno,
}) async {
  WidgetsFlutterBinding.ensureInitialized();
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  Bloc.observer = const AppBlocObserver();

  final CustomerDataSource customerDataSource = CustomerDataSource();
  final CityDataSource cityDataSource = CityDataSource();
  // todo(sam): add provider?
  final CityRepository cityRepository =
      CityRepository(cityDataSource: cityDataSource);
  final CustomerRepository customerRepository =
      CustomerRepository(customerDataSource: customerDataSource);

  runApp(
    await builder(),
  );
}
