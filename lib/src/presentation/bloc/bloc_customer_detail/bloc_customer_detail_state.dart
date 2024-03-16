part of 'bloc_customer_detail.dart';

/// {@template BlocCustomerDetailState}
/// Handles the different states and variables in BlocCustomerDetail.
/// {@endtemplate}
class BlocCustomerDetailState {
  /// {@macro BlocCustomerDetailState}
  const BlocCustomerDetailState._({
    this.listCustomers = const [],
  });

  BlocCustomerDetailState.from(
    BlocCustomerDetailState otherState, {
    List<Customer>? listCustomers,
  }) : this._(listCustomers: listCustomers ?? otherState.listCustomers);

  List<Object> get props => [
        listCustomers,
      ];

  /// List of customers
  final List<Customer> listCustomers;
}

/// {@template BlocCustomerDetailStateInicial}
/// Initial state of the Customer Detail page.
/// {@endtemplate}
class BlocCustomerDetailStateInicial extends BlocCustomerDetailState {
  /// {@macro BlocCustomerDetailStateInicial}
  const BlocCustomerDetailStateInicial() : super._();
}

/// {@template BlocCustomerDetailStateLoading}
/// Loading state of the CustomerDetail page.
/// {@endtemplate}
class BlocCustomerDetailStateLoading extends BlocCustomerDetailState {
  /// {@macro BlocCustomerDetailStateLoading}
  BlocCustomerDetailStateLoading.from(super.otherState) : super.from();
}

/// {@template BlocCustomerDetailStateSuccess}
/// Success state of the components of the CustomerDetailPage
/// {@endtemplate}
class BlocCustomerDetailStateSuccess extends BlocCustomerDetailState {
  /// {@macro BlocCustomerDetailStateSuccess}
  BlocCustomerDetailStateSuccess.from(
    super.otherState, {
    super.listCustomers,
  }) : super.from();
}

/// {@template BlocCustomerDetailStateError}
/// Error state of the components of the CustomerDetailPage
/// {@endtemplate}
class BlocCustomerDetailStateError extends BlocCustomerDetailState {
  /// {@macro BlocCustomerDetailStateError}
  BlocCustomerDetailStateError.from(super.otherState) : super.from();
}
