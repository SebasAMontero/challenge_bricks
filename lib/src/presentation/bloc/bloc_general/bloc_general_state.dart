part of 'bloc_general.dart';

/// {@template BlocGeneralState}
/// Manages the state of BlocGeneral
/// {@endtemplate}
class BlocGeneralState {
  /// {@macro BlocGeneralState}
  const BlocGeneralState._({
    required this.customerRepository,
    required this.cityRepository,
  });

  BlocGeneralState.from(
    BlocGeneralState otherState, {
    CustomerRepository? customerRepository,
    CityRepository? cityRepository,
  }) : this._(
          customerRepository:
              customerRepository ?? otherState.customerRepository,
          cityRepository: cityRepository ?? otherState.cityRepository,
        );

  final CustomerRepository customerRepository;
  final CityRepository cityRepository;

  List<Object?> get props => [
        customerRepository,
        cityRepository,
      ];
}

/// {@template BlocGeneralStateInitial}
/// Initial state of the general bloc.
/// {@endtemplate}
class BlocGeneralStateInitial extends BlocGeneralState {
  /// {@macro BlocGeneralStateInitial}
  BlocGeneralStateInitial({
    required CustomerRepository customerRepository,
    required CityRepository cityRepository,
  }) : super._(
          customerRepository: customerRepository,
          cityRepository: cityRepository,
        );
}

/// {@template BlocGeneralStateLoading}
/// Loading state of the General page.
/// {@endtemplate}
class BlocGeneralStateLoading extends BlocGeneralState {
  /// {@macro BlocGeneralStateLoading}
  BlocGeneralStateLoading.from(super.otherState) : super.from();
}

/// {@template BlocGeneralStateSuccess}
/// Success state of the components of the GeneralPage
/// {@endtemplate}
class BlocGeneralStateSuccess extends BlocGeneralState {
  /// {@macro BlocGeneralStateSuccess}
  BlocGeneralStateSuccess.from(
    super.otherState, {
    super.customerRepository,
    super.cityRepository,
  }) : super.from();
}

/// {@template BlocGeneralStateError}
/// Error state of the components of the GeneralPage
/// {@endtemplate}
class BlocGeneralStateError extends BlocGeneralState {
  /// {@macro BlocGeneralStateError}
  BlocGeneralStateError.from(
    super.otherState, {
    required this.errorMessage,
  }) : super.from();

  final String errorMessage;
}
