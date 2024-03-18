import 'dart:async';

import 'package:flutter/material.dart';

import 'dart:developer';

import 'package:flutter/widgets.dart';

Future<void> bootstrap(
  FutureOr<Widget> Function() builder, {
  String? hostUrl,
  String? environment,
}) async {
  WidgetsFlutterBinding.ensureInitialized();
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  runApp(
    await builder(),
  );
}
