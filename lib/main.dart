import 'package:bricks_app_flutter/bootstrap.dart';
import 'package:flutter/material.dart';
import 'package:bricks_app_flutter/src/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await bootstrap(App.new,);
  
}
