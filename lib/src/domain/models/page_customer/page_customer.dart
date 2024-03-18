import 'package:bricks_app_flutter/src/domain/models/customer/customer.dart';

class PageCustomer {
  PageCustomer({
    required this.currentPage,
    required this.listCustomers,
  });
  int currentPage;
  List<Customer> listCustomers;

  factory PageCustomer.fromJson(Map<String, dynamic> json) {
    return PageCustomer(
      currentPage: json['currentPage'],
      listCustomers: (json['listCustomers'] as List)
          .map((customerJson) => Customer.fromJson(customerJson))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'currentPage': currentPage,
      'listCustomers':
          listCustomers.map((customer) => customer.toJson()).toList(),
    };
  }
}
