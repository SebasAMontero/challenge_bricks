part of 'bloc_home.dart';

/// {@template BlocHomeState}
/// Handles the different states and variables in BlocHome.
/// {@endtemplate}
class BlocHomeState {
  /// {@macro BlocHomeState}
  const BlocHomeState._();

  BlocHomeState.from() : this._();

  List<Object> get props => [];
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
  BlocHomeStateLoading.from() : super.from();
}

/// {@template BlocHomeStateSuccess}
/// Success state of the components of the HomePage 
/// {@endtemplate}
class BlocHomeStateSuccess extends BlocHomeState {
  /// {@macro BlocHomeStateSuccess}
  BlocHomeStateSuccess.from() : super.from();
}

 

/// {@template BlocHomeStateError}
/// Error state of the components of the HomePage 
/// {@endtemplate}
class BlocHomeStateError extends BlocHomeState {
  /// {@macro BlocHomeStateError}
  BlocHomeStateError.from() : super.from();
}

 