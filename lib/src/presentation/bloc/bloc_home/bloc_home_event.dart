part of 'bloc_home.dart';

/// {@template BlocHomeEvent}
/// Events for the [BlocHome]
/// {@endtemplate}
abstract class BlocHomeEvent {
  /// {@macro BlocHomeEvent}
  const BlocHomeEvent();
}

/// {@template BlocHomeEventInitialize}
/// The event is called when the home page is being loaded.
/// {@endtemplate}
class BlocHomeEventInitialize extends BlocHomeEvent {
  /// {@macro BlocHomeEventInitialize}
  const BlocHomeEventInitialize();
}
