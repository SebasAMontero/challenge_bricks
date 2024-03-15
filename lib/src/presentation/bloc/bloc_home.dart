import 'package:bloc/bloc.dart';

part 'bloc_home_state.dart';
part 'bloc_home_event.dart';

/// {@template BlocHome}
/// Handles the state and logic of the [HomePage]
/// {@endtemplate}
class BlocHome extends Bloc<BlocHomeEvent, BlocHomeState> {
  /// {@macro BlocHome}
  BlocHome() : super(const BlocHomeStateInicial()) {
    on<BlocHomeEventInitialize>(
      _initialize,
    );
  }

  /// Initializes data and adds it to the state.
  Future<void> _initialize(
    BlocHomeEventInitialize event,
    Emitter<BlocHomeState> emit,
  ) async {
    emit(BlocHomeStateLoading.from());
      emit(BlocHomeStateSuccess.from());
  }
}
