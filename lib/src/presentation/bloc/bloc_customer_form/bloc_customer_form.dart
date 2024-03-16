import 'package:bloc/bloc.dart';
import 'package:bricks_app_flutter/src/data/datasources/city_data_source.dart';
import 'package:bricks_app_flutter/src/data/datasources/customer_data_source.dart';
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
  BlocCustomerForm({this.getCustomerRepository, this.getCityRepository})
      : super(const BlocCustomerFormStateInicial()) {
    on<BlocCustomerFormEventInitialize>(
      _initializeCities,
    );
    on<BlocCustomerFormEventSubmitCustomer>(
      _submitCustomer,
    );
  }
  final CustomerRepository? getCustomerRepository;
  final CityRepository? getCityRepository;

  /// Initializes data and adds it to the state.
  Future<void> _initializeCities(
    BlocCustomerFormEventInitialize event,
    Emitter<BlocCustomerFormState> emit,
  ) async {
    emit(BlocCustomerFormStateLoading.from(state));

    final CityDataSource cityDataSource = CityDataSource();
    // todo(sam): add provider?
    final CityRepository cityRepository =
        CityRepository(cityDataSource: cityDataSource);
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

    final CustomerDataSource customerDataSource = CustomerDataSource();

    final CustomerRepository customerRepository =
        CustomerRepository(customerDataSource: customerDataSource);
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
