import 'package:bloc/bloc.dart';

part 'bloc_home_state.dart';
part 'bloc_login_event.dart';

/// {@template BlocHome}
/// Bloc que maneja los estados y lógica de la pagina de 'Login'
/// {@endtemplate}
class BlocHome extends Bloc<BlocHomeEvent, BlocHomeState> {
  /// {@macro BlocHome}
  BlocHome() : super(const BlocHomeStateInicial()) {
    on<BlocHomeEventInitialize>(
      _initialize,
    );
  }

  /// Permite al usuario iniciar sesion con Email o DNI
  Future<void> _initialize(
    BlocHomeEventInitialize event,
    Emitter<BlocHomeState> emit,
  ) async {
    emit(BlocHomeStateLoading.desde());
  }
}
