import 'dart:async';

 
import 'package:bricks_app_flutter/src/data/datasources/city_data_source.dart';
import 'package:bricks_app_flutter/src/data/datasources/customer_data_source.dart';
import 'package:bricks_app_flutter/src/data/repositories/city_repository.dart';
import 'package:bricks_app_flutter/src/data/repositories/customer_repository.dart';
import 'package:flutter/material.dart';

import 'dart:developer';

import 'package:flutter/widgets.dart';

Future<void> bootstrap(
  FutureOr<Widget> Function() builder, {
  String? hostUrl,
  String? entorno,
}) async {
  WidgetsFlutterBinding.ensureInitialized();
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

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
