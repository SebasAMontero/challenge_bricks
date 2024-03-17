import 'package:bloc/bloc.dart';
import 'package:bricks_app_flutter/src/data/repositories/city_repository.dart';
import 'package:bricks_app_flutter/src/data/repositories/customer_repository.dart';
import 'package:bricks_app_flutter/src/domain/models/city/city.dart';
import 'package:bricks_app_flutter/src/domain/models/customer/customer.dart';

part 'bloc_customer_form_state.dart';
part 'bloc_customer_form_event.dart';

/// {@template BlocCustomerForm}
/// Handles the state and logic of the CustomerFormPage
/// {@endtemplate}
class BlocCustomerForm
    extends Bloc<BlocCustomerFormEvent, BlocCustomerFormState> {
  /// {@macro BlocCustomerForm}
  BlocCustomerForm({
    required this.customerRepository,
    required this.cityRepository,
  }) : super(const BlocCustomerFormStateInitial()) {
    on<BlocCustomerFormEventInitialize>(_initializeCities);
    on<BlocCustomerFormEventSubmitCustomer>(_submitCustomer);
  }
  final CustomerRepository customerRepository;
  final CityRepository cityRepository;

  /// Initializes data and adds it to the state.
  Future<void> _initializeCities(
    BlocCustomerFormEventInitialize event,
    Emitter<BlocCustomerFormState> emit,
  ) async {
    emit(BlocCustomerFormStateLoading.from(state));

    try {
      final listCities = await cityRepository.fetchCities();

      emit(
        BlocCustomerFormStateSuccess.from(
          state,
          listCities: listCities,
        ),
      );
    } catch (error) {
      emit(
        BlocCustomerFormStateError.from(
          state,
          errorMessage: error.toString(),
        ),
      );
    }
  }

  /// Adds the recently created customer to the database.
  Future<void> _submitCustomer(
    BlocCustomerFormEventSubmitCustomer event,
    Emitter<BlocCustomerFormState> emit,
  ) async {
    emit(BlocCustomerFormStateLoading.from(state));

    try {
      final createdCustomer = await customerRepository.postCustomer(
        name: event.name,
        email: event.email,
        cityId: event.cityId,
      );
      emit(
        BlocCustomerFormStateSubmitCustomerSuccess.from(
          state,
          createdCustomer: createdCustomer,
        ),
      );
    } catch (error) {
      emit(
        BlocCustomerFormStateError.from(
          state,
          errorMessage: error.toString(),
        ),
      );
    }
  }
}
