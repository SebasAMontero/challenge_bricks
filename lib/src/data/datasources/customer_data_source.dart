import 'dart:convert';

import 'package:bricks_app_flutter/src/data/datasources/i_customer_data_source.dart';
import 'package:bricks_app_flutter/src/domain/models/customer/customer.dart';
import 'package:http/http.dart' show Client;

import '../../constants/strings.dart';

class CustomerDataSource implements ICustomerDataSource {
  final Client client = Client();
  static const int pageItemSize = 20;

  @override
  Future<List<Customer>> fetchCustomers() async {
// TODO(SAM): Add pagination
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

  @override
  Future<Customer> postCustomer({
    required String name,
    required String email,
    required int cityId,
  }) async {
    final Map<String, dynamic> requestBody = {
      'name': name,
      'email': email,
      'cityId': cityId,
    };
    final jsonBody = json.encode(requestBody);

    final response = await client.post(
      Uri.parse('${Strings.baseUrl}${Strings.customerEndpoint}'),
      body: jsonBody,
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 201 || response.statusCode == 200) {
      final Map<String, dynamic> customerJson = json.decode(response.body);
      return Customer.fromJson(customerJson);
    } else {
      throw Exception(
          'Failed to create customer. Status code: ${response.statusCode}');
    }
  }
}
