import 'package:bricks_app_flutter/src/domain/models/customer/customer.dart';

/// {@template ICustomerDataSource}
/// Abstract class that defines the contract for the customer data source.
/// {@endtemplate}
abstract class ICustomerDataSource {
  /// Returns a [Future] that retrieves a paginated list of customers from the server.
  Future<List<Customer>> fetchCustomers();

  /// Returns a [Future] that retrieves the number of customers in the Database.
  Future<int> fetchCustomerCount();

  /// Returns a [Future] that retrieves a specific customer.
  Future<Customer> fetchCustomerById({
    required int idCustomer,
  });

  /// Deletes a customer from the database
  Future<bool> deleteCustomerById({
    required int idCustomer,
  });

  /// Returns a [Future] that retrieves a [Customer] after it was successfully created.
  Future<Customer> postCustomer({
    required String name,
    required String email,
    required int cityId,
  });
}
