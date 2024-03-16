import 'package:bricks_app_flutter/src/domain/models/customer/customer.dart';

abstract class ICustomerDataSource {
  Future<List<Customer>> fetchCustomers();
}
