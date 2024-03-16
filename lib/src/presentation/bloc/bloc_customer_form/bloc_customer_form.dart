import 'package:bloc/bloc.dart';
import 'package:bricks_app_flutter/src/data/datasources/city_data_source.dart';
import 'package:bricks_app_flutter/src/data/repositories/city_repository.dart';
import 'package:bricks_app_flutter/src/data/repositories/customer_repository.dart';
import 'package:bricks_app_flutter/src/domain/models/city/city.dart';

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

    final listCities = await cityRepository.fetchCities();

    emit(
      BlocCustomerFormStateSuccess.from(
        state,
        listCities: listCities,
      ),
    );
  }
}
