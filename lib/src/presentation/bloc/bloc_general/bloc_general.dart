import 'package:bricks_app_flutter/src/data/repositories/city_repository.dart';
import 'package:bricks_app_flutter/src/data/repositories/customer_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'bloc_general_event.dart';
part 'bloc_general_state.dart';

/// {@template BlocGeneral}
/// Bloc that manages the states and logic of the 'Shipments' page
/// {@endtemplate}
class BlocGeneral extends Bloc<BlocGeneralEvent, BlocGeneralState> {
  /// {@macro BlocGeneral}
  BlocGeneral({
    required this.customerRepository,
    required this.cityRepository,
  }) : super(BlocGeneralStateInitial(
            customerRepository: customerRepository,
            cityRepository: cityRepository,)) {
    on<BlocGeneralEventInitialize>(_onInitialize);
  }

  final CustomerRepository customerRepository;
  final CityRepository cityRepository;

  /// Adds the dependencies to the state.
  Future<void> _onInitialize(
    BlocGeneralEventInitialize event,
    Emitter<BlocGeneralState> emit,
  ) async {
    try {
      emit(BlocGeneralStateSuccess.from(
        state,
        cityRepository: cityRepository,
        customerRepository: customerRepository,
      ));
    } catch (e) {
      emit(
        BlocGeneralStateError.from(
          state,
          errorMessage: e.toString(),
        ),
      );
    }
  }
}
