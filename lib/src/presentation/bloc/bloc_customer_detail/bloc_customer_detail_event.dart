part of 'bloc_customer_detail.dart';

/// {@template BlocCustomerDetailEvent}
/// Events for the [BlocCustomerDetail]
/// {@endtemplate}
abstract class BlocCustomerDetailEvent {
  /// {@macro BlocCustomerDetailEvent}
  const BlocCustomerDetailEvent();
}

/// {@template BlocCustomerDetailEventInitialize}
/// The event is called when the customer detail page is being loaded.
/// {@endtemplate}
class BlocCustomerDetailEventInitialize extends BlocCustomerDetailEvent {
  /// {@macro BlocCustomerDetailEventInitialize}
  const BlocCustomerDetailEventInitialize({required this.idCustomer});

  final int idCustomer;
}

/// {@template BlocCustomerDetailEventDeleteCustomer}
/// The event is called when the customer detail button is pressted to delete a user by its ID.
/// {@endtemplate}
class BlocCustomerDetailEventDeleteCustomer extends BlocCustomerDetailEvent {
  /// {@macro BlocCustomerDetailEventDeleteCustomer}
  const BlocCustomerDetailEventDeleteCustomer({required this.idCustomer});

  final int idCustomer;
}
