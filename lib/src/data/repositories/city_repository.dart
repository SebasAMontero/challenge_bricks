import 'package:bricks_app_flutter/src/domain/datasources/i_city_data_source.dart';
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

  /// Gets the Json of cities, maps and models it.
  Future<List<City>> fetchCities() async {
    final cityJsonList = await _cityDataSource.fetchCities();
    List<City> cities =
        cityJsonList.map((json) => City.fromJson(json)).toList();

    return cities;
  }
}
