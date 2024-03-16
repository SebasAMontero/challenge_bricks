import 'package:bricks_app_flutter/src/data/datasources/i_city_data_source.dart';
import 'package:bricks_app_flutter/src/domain/models/city/city.dart';

class CityRepository {
  CityRepository({
    required ICityDataSource cityDataSource,
  }) : _cityDataSource = cityDataSource;

  final ICityDataSource _cityDataSource;

  Future<List<City>> fetchCities() async {
    final listCities = await _cityDataSource.fetchCities();

    return listCities;
  }
}
