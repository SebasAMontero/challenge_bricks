part of 'bloc_customer_form.dart';

/// {@template BlocCustomerFormEvent}
/// Events for the [BlocCustomerForm]
/// {@endtemplate}
abstract class BlocCustomerFormEvent {
  /// {@macro BlocCustomerFormEvent}
  const BlocCustomerFormEvent();
}

/// {@template BlocCustomerFormEventInitialize}
/// The event is called when the Customer Form page is being loaded.
/// {@endtemplate}
class BlocCustomerFormEventInitialize extends BlocCustomerFormEvent {
  /// {@macro BlocCustomerFormEventInitialize}
  const BlocCustomerFormEventInitialize();
}

/// {@template BlocCustomerFormEventSubmitCustomer}
/// The event is called when the Customer Form page is being loaded.
/// {@endtemplate}
class BlocCustomerFormEventSubmitCustomer extends BlocCustomerFormEvent {
  /// {@macro BlocCustomerFormEventSubmitCustomer}
  const BlocCustomerFormEventSubmitCustomer({
    required this.name,
    required this.email,
    required this.cityId,
  });

  final String name;
  final String email;
  final int cityId;
}
