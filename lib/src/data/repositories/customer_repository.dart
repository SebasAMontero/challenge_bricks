import 'package:bricks_app_flutter/src/domain/models/customer/customer.dart';

import '../datasources/i_customer_data_source.dart';

class CustomerRepository {
  CustomerRepository({
    required ICustomerDataSource customerDataSource,
  }) : _customerDataSource = customerDataSource;

  final ICustomerDataSource _customerDataSource;

  Future<List<Customer>> fetchCustomersByPage() async {
    final customer = await _customerDataSource.fetchCustomers();

    return customer;
  }

  Future<Customer> postCustomer({
    required String name,
    required String email,
    required int cityId,
  }) async {
    final customer = await _customerDataSource.postCustomer(
      name: name,
      email: email,
      cityId: cityId,
    );

    return customer;
  }
}
