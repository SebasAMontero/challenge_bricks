part of 'bloc_home.dart';

/// {@template BlocHomeState}
/// Handles the different states and variables in BlocHome.
/// {@endtemplate}
class BlocHomeState {
  /// {@macro BlocHomeState}
  const BlocHomeState._({
    this.listCustomers = const [],
    this.customerCount = 0,
  });

  BlocHomeState.from(
    BlocHomeState otherState, {
    List<Customer>? listCustomers,
    int? customerCount,
  }) : this._(
          listCustomers: listCustomers ?? otherState.listCustomers,
          customerCount: customerCount ?? otherState.customerCount,
        );

  List<Object> get props => [
        listCustomers,
        customerCount,
      ];

  /// List of customers
  final List<Customer> listCustomers;

  /// Total number of customers in the database
  final int customerCount;
}

/// {@template BlocHomeStateInicial}
/// Initial state of the home page.
/// {@endtemplate}
class BlocHomeStateInicial extends BlocHomeState {
  /// {@macro BlocHomeStateInicial}
  const BlocHomeStateInicial() : super._();
}

/// {@template BlocHomeStateLoading}
/// Loading state of the Home page.
/// {@endtemplate}
class BlocHomeStateLoading extends BlocHomeState {
  /// {@macro BlocHomeStateLoading}
  BlocHomeStateLoading.from(super.otherState) : super.from();
}

/// {@template BlocHomeStateSuccess}
/// Success state of the components of the HomePage
/// {@endtemplate}
class BlocHomeStateSuccess extends BlocHomeState {
  /// {@macro BlocHomeStateSuccess}
  BlocHomeStateSuccess.from(
    super.otherState, {
    super.listCustomers,
    super.customerCount,
  }) : super.from();
}

/// {@template BlocHomeStateError}
/// Error state of the components of the HomePage
/// {@endtemplate}
class BlocHomeStateError extends BlocHomeState {
  /// {@macro BlocHomeStateError}
  BlocHomeStateError.from(
    super.otherState, {
    required this.errorMessage,
  }) : super.from();

  final String errorMessage;
}
