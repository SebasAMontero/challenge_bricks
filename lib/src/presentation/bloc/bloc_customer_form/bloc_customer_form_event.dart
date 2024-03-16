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
