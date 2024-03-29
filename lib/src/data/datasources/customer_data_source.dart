import 'dart:convert';
import 'package:bricks_app_flutter/src/constants/doubles.dart';
import 'package:bricks_app_flutter/src/domain/datasources/i_customer_data_source.dart';
import 'package:bricks_app_flutter/src/domain/models/customer/customer.dart';
import 'package:http/http.dart' show Client;

import '../../constants/strings.dart';

/// {@template CustomerDataSource}
/// Is responsible for fetching [Customer] data from an external API.
/// It implements the ICityDataSource interface.
/// {@endtemplate}
class CustomerDataSource implements ICustomerDataSource {
  final Client client = Client();

  @override
  Future<List<dynamic>> fetchCustomersByPage({
    required int currentPage,
  }) async {
    final response = await client.get(
      Uri.parse(
        '${Strings.baseUrl}${Strings.customerEndpoint}?page=$currentPage&size=${Doubles.pageItemSize}',
      ),
    );

    if (response.statusCode == 200) {
      final String responseBody = utf8.decode(response.bodyBytes);

      final List<dynamic> customersJsonList = json.decode(responseBody);

      return customersJsonList;
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

  @override
  Future<int> fetchCustomerCount() async {
    final response = await client.get(
      Uri.parse(
        '${Strings.baseUrl}${Strings.customerCountEndpoint}',
      ),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);
      final int customerCount = responseData['count'];
      return customerCount;
    } else {
      throw Exception(
        'Error Fetching Data, Http Status Code == "${response.statusCode}"',
      );
    }
  }

  @override
  Future<dynamic> fetchCustomerById({
    required idCustomer,
  }) async {
    final response = await client.get(
      Uri.parse(
        '${Strings.baseUrl}${Strings.customerEndpoint}/$idCustomer',
      ),
    );

    if (response.statusCode == 200) {
      final String responseBody = utf8.decode(response.bodyBytes);
      final Map<String, dynamic> customerJson = json.decode(responseBody);
      return  customerJson;
    } else {
      throw Exception(
        'Error Fetching Data, Http Status Code == "${response.statusCode}"',
      );
    }
  }

  @override
  Future<bool> deleteCustomerById({
    required idCustomer,
  }) async {
    final response = await client.delete(
      Uri.parse(
        '${Strings.baseUrl}${Strings.customerEndpoint}/$idCustomer',
      ),
    );
    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception(
        'Error Fetching Data, Http Status Code == "${response.statusCode}"',
      );
    }
  }
}
