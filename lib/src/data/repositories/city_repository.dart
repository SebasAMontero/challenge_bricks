import 'package:bricks_app_flutter/src/data/datasources/i_city_data_source.dart';
import 'package:bricks_app_flutter/src/domain/models/city/city.dart';

/// {@template CityRepository}
/// Is responsible for managing the retrieval of city data.
/// {@endtemplate}
class CityRepository {
  /// {@macro CityRepository}
  CityRepository({
    required ICityDataSource cityDataSource,
  }) : _cityDataSource = cityDataSource;

  final ICityDataSource _cityDataSource;

  Future<List<City>> fetchCities() async {
    final listCities = await _cityDataSource.fetchCities();

    return listCities;
  }
}
