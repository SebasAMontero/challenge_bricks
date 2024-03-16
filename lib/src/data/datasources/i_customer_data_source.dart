import 'package:bricks_app_flutter/src/domain/models/customer/customer.dart';

abstract class ICustomerDataSource {
  /// Returns a [Future] that retrieves a paginated list of customers from the server.
  Future<List<Customer>> fetchCustomers();

  /// Returns a [Future] that retrieves a [Customer] after it was successfully created.
  Future<Customer> postCustomer({
    required String name,
    required String email,
    required int cityId,
  });
}
