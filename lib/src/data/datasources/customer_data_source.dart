import 'dart:convert';

import 'package:bricks_app_flutter/src/data/datasources/i_customer_data_source.dart';
import 'package:bricks_app_flutter/src/domain/models/city/city.dart';
import 'package:bricks_app_flutter/src/domain/models/customer/customer.dart';
import 'package:http/http.dart' show Client;

import '../../constants/strings.dart';

class CustomerDataSource implements ICustomerDataSource {
  final Client client = Client();
  static const int pageItemSize = 20;

  @override
  Future<List<Customer>> fetchCustomers() async {
// TODO(SAM): Add page and for each
    final response = await client.get(
      Uri.parse(
        '${Strings.baseUrl}${Strings.customerEndpoint}?page=0&size=$pageItemSize',
      ),
    );

    if (response.statusCode == 200) {
      final List<dynamic> customersJsonList = json.decode(response.body);
      List<Customer> customers =
          customersJsonList.map((json) => Customer.fromJson(json)).toList();
      return customers;
    } else {
      throw Exception(
        'Error Fetching Data, Http Status Code == "${response.statusCode}"',
      );
    }
  }
}
