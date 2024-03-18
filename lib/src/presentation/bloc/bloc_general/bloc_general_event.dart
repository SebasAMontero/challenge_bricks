part of 'bloc_general.dart';

/// {@template BlocGeneralEvent}
/// Provides the app of instances.
/// {@endtemplate}
abstract class BlocGeneralEvent {
  /// {@macro BlocGeneralEvent}
  const BlocGeneralEvent();
}

/// {@template BlocGeneralEventInitialize}
/// Initial event of BlocGeneral
/// {@endtemplate}
class BlocGeneralEventInitialize extends BlocGeneralEvent {}
