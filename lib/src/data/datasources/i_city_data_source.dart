import 'package:bricks_app_flutter/src/domain/models/city/city.dart';

abstract class ICityDataSource {
  Future<List<City>> fetchCities();
}
