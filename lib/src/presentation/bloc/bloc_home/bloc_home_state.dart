part of 'bloc_home.dart';

/// {@template BlocHomeState}
/// Handles the different states and variables in BlocHome.
/// {@endtemplate}
class BlocHomeState {
  /// {@macro BlocHomeState}
  const BlocHomeState._({
    this.listCustomers = const [],
    this.customerCount = 0,
    this.currentPage = 0,
    this.numberOfPages = 0,
  });

  BlocHomeState.from(
    BlocHomeState otherState, {
    List<Customer>? listCustomers,
    int? customerCount,
    int? currentPage,
    double? numberOfPages,
  }) : this._(
          listCustomers: listCustomers ?? otherState.listCustomers,
          customerCount: customerCount ?? otherState.customerCount,
          currentPage: currentPage ?? otherState.currentPage,
          numberOfPages: numberOfPages ?? otherState.numberOfPages,
        );

  List<Object> get props => [
        listCustomers,
        customerCount,
        currentPage,
        numberOfPages,
      ];

  /// List of customers
  final List<Customer> listCustomers;

  /// Total number of customers in the database
  final int customerCount;

  /// Current page number
  final int currentPage;

  /// Total number of pages
  final double numberOfPages;
}

/// {@template BlocHomeStateInitial}
/// Initial state of the home page.
/// {@endtemplate}
class BlocHomeStateInitial extends BlocHomeState {
  /// {@macro BlocHomeStateInitial}
  const BlocHomeStateInitial() : super._();
}

/// {@template BlocHomeStateLoading}
/// Loading state of the Home page.
/// {@endtemplate}
class BlocHomeStateLoading extends BlocHomeState {
  /// {@macro BlocHomeStateLoading}
  BlocHomeStateLoading.from(super.otherState) : super.from();
}

/// {@template BlocHomeStateLoadingPagination}
/// Loading state of the Home page, when its loading a new page of customers.
/// {@endtemplate}
class BlocHomeStateLoadingPagination extends BlocHomeState {
  /// {@macro BlocHomeStateLoadingPagination}
  BlocHomeStateLoadingPagination.from(super.otherState) : super.from();
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
    super.currentPage,
    super.numberOfPages,
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
