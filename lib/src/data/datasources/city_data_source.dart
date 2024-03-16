import 'dart:convert';

import 'package:bricks_app_flutter/src/data/datasources/i_city_data_source.dart';
import 'package:bricks_app_flutter/src/domain/models/city/city.dart';
import 'package:http/http.dart' show Client;

import '../../constants/strings.dart';

class CityDataSource implements ICityDataSource {
  final Client client = Client();

  @override
  Future<List<City>> fetchCities() async {
    final response = await client.get(
      Uri.parse(
        '${Strings.baseUrl}${Strings.cityEndpoint}',
      ),
    );

    if (response.statusCode == 200) {
      final List<dynamic> cityJsonList = json.decode(response.body);
      List<City> cities =
          cityJsonList.map((json) => City.fromJson(json)).toList();
      return cities;
    } else {
      throw Exception(
        'Error Fetching Data, Http Status Code == "${response.statusCode}"',
      );
    }
  }
}
