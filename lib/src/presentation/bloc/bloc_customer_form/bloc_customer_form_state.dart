part of 'bloc_customer_form.dart';

/// {@template BlocCustomerFormState}
/// Handles the different states and variables in BlocCustomerForm.
/// {@endtemplate}
class BlocCustomerFormState {
  /// {@macro BlocCustomerFormState}
  const BlocCustomerFormState._({
    this.listCities = const [],
    this.createdCustomer,
  });

  BlocCustomerFormState.from(
    BlocCustomerFormState otherState, {
    List<City>? listCities,
    Customer? createdCustomer,
  }) : this._(
          listCities: listCities ?? otherState.listCities,
          createdCustomer: createdCustomer ?? otherState.createdCustomer,
        );

  List<Object> get props => [
        listCities,
      ];

  /// List of customers
  final List<City> listCities;

  /// Recently created customer.
  final Customer? createdCustomer;
}

/// {@template BlocCustomerFormStateInicial}
/// Initial state of the Customer Form page.
/// {@endtemplate}
class BlocCustomerFormStateInicial extends BlocCustomerFormState {
  /// {@macro BlocCustomerFormStateInicial}
  const BlocCustomerFormStateInicial() : super._();
}

/// {@template BlocCustomerFormStateLoading}
/// Loading state of the CustomerForm page.
/// {@endtemplate}
class BlocCustomerFormStateLoading extends BlocCustomerFormState {
  /// {@macro BlocCustomerFormStateLoading}
  BlocCustomerFormStateLoading.from(super.otherState) : super.from();
}

/// {@template BlocCustomerFormStateSuccess}
/// Success state of the components of the CustomerFormPage
/// {@endtemplate}
class BlocCustomerFormStateSuccess extends BlocCustomerFormState {
  /// {@macro BlocCustomerFormStateSuccess}
  BlocCustomerFormStateSuccess.from(
    super.otherState, {
    super.listCities,
    super.createdCustomer,
  }) : super.from();
}

/// {@template BlocCustomerFormStateSubmitCustomerSuccess}
/// Success state of the components of the CustomerFormPage
/// {@endtemplate}
class BlocCustomerFormStateSubmitCustomerSuccess extends BlocCustomerFormState {
  /// {@macro BlocCustomerFormStateSubmitCustomerSuccess}
  BlocCustomerFormStateSubmitCustomerSuccess.from(
    super.otherState, {
    super.listCities,
    super.createdCustomer,
  }) : super.from();
}

/// {@template BlocCustomerFormStateError}
/// Error state of the components of the CustomerFormPage
/// {@endtemplate}
class BlocCustomerFormStateError extends BlocCustomerFormState {
  /// {@macro BlocCustomerFormStateError}
  BlocCustomerFormStateError.from(
    super.otherState, {
    required this.errorMessage,
  }) : super.from();
  final String errorMessage;
}
