part of 'bloc_customer_detail.dart';

/// {@template BlocCustomerDetailState}
/// Handles the different states and variables in BlocCustomerDetail.
/// {@endtemplate}
class BlocCustomerDetailState {
  /// {@macro BlocCustomerDetailState}
  const BlocCustomerDetailState._({
    this.customer,
  });

  BlocCustomerDetailState.from(
    BlocCustomerDetailState otherState, {
    Customer? customer,
  }) : this._(
          customer: customer ?? otherState.customer,
        );

  List<Object?> get props => [
        customer,
      ];

  /// Customer
  final Customer? customer;
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
    super.customer,
  }) : super.from();
}

/// {@template BlocCustomerDetailStateDeletedCustomerSuccess}
/// Success state of the components of the CustomerDetailPage, when the Customer is deleted.
/// {@endtemplate}
class BlocCustomerDetailStateDeletedCustomerSuccess
    extends BlocCustomerDetailState {
  /// {@macro BlocCustomerDetailStateDeletedCustomerSuccess}
  BlocCustomerDetailStateDeletedCustomerSuccess.from(
    super.otherState,
  ) : super.from();
}

/// {@template BlocCustomerDetailStateError}
/// Error state of the components of the CustomerDetailPage
/// {@endtemplate}
class BlocCustomerDetailStateError extends BlocCustomerDetailState {
  /// {@macro BlocCustomerDetailStateError}
  BlocCustomerDetailStateError.from(
    super.otherState, {
    required this.errorMessage,
  }) : super.from();

  final String errorMessage;
}
