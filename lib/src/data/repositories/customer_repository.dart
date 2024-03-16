import 'package:bricks_app_flutter/src/domain/models/customer/customer.dart';

import '../datasources/i_customer_data_source.dart';

class CustomerRepository {
  CustomerRepository({
    required ICustomerDataSource customerDataSource,
  }) : _customerDataSource = customerDataSource;

  final ICustomerDataSource _customerDataSource;
  // todo(sam): add docu
  ///
  Future<List<Customer>> fetchCustomersByPage() async {
    final customer = await _customerDataSource.fetchCustomers();

    return customer;
  }

  /// Creates a customer and adds it to the database
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

  /// Returns the number of customers in the database
  Future<int> fetchCustomerCount() async {
    final customerCounter = await _customerDataSource.fetchCustomerCount();
    return customerCounter;
  }

  /// Returns the number of customers in the database
  Future<Customer> fetchCustomerById({required idCustomer}) async {
    final customer =
        await _customerDataSource.fetchCustomerById(idCustomer: idCustomer);
    return customer;
  }

  /// Returns the number of customers in the database
  Future<bool> deleteCustomerById({required idCustomer}) async {
    final isDeleted =
        await _customerDataSource.deleteCustomerById(idCustomer: idCustomer);
    return isDeleted;
  }
}
