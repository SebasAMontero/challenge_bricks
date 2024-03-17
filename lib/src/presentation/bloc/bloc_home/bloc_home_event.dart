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

/// {@template BlocHomeEventNextPage}
/// The event is called to navigate to the next page.
/// {@endtemplate}
class BlocHomeEventNextPage extends BlocHomeEvent {
  /// {@macro BlocHomeEventNextPage}
  const BlocHomeEventNextPage();
}

/// {@template BlocHomeEventPreviousPage}
/// The event is called to navigate to the previous page.
/// {@endtemplate}
class BlocHomeEventPreviousPage extends BlocHomeEvent {
  /// {@macro BlocHomeEventPreviousPage}
  const BlocHomeEventPreviousPage();
}
