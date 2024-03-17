import 'package:bricks_app_flutter/src/domain/models/city/city.dart';

/// {@template ICityDataSource}
/// Abstract class that defines the contract for the city data source.
/// {@endtemplate}
abstract class ICityDataSource {
  Future<List<City>> fetchCities();
}
