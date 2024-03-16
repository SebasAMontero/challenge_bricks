import 'package:bloc/bloc.dart';
import 'package:bricks_app_flutter/src/data/datasources/city_data_source.dart';
import 'package:bricks_app_flutter/src/data/datasources/customer_data_source.dart';
import 'package:bricks_app_flutter/src/data/repositories/city_repository.dart';
import 'package:bricks_app_flutter/src/data/repositories/customer_repository.dart';
import 'package:bricks_app_flutter/src/domain/models/city/city.dart';
import 'package:bricks_app_flutter/src/domain/models/customer/customer.dart';

part 'bloc_home_state.dart';
part 'bloc_home_event.dart';

/// {@template BlocHome}
/// Handles the state and logic of the [HomePage]
/// {@endtemplate}
class BlocHome extends Bloc<BlocHomeEvent, BlocHomeState> {
  /// {@macro BlocHome}
  BlocHome({this.getCustomerRepository, this.getCityRepository})
      : super(const BlocHomeStateInicial()) {
    on<BlocHomeEventInitialize>(
      _initialize,
    );
  }
  final CustomerRepository? getCustomerRepository;
  final CityRepository? getCityRepository;

  /// Initializes data and adds it to the state.
  Future<void> _initialize(
    BlocHomeEventInitialize event,
    Emitter<BlocHomeState> emit,
  ) async {
    emit(BlocHomeStateLoading.from(state));

    final CustomerDataSource customerDataSource = CustomerDataSource();
    final CityDataSource cityDataSource = CityDataSource();
    // todo(sam): add provider?
    final CityRepository cityRepository =
        CityRepository(cityDataSource: cityDataSource);
    final CustomerRepository customerRepository =
        CustomerRepository(customerDataSource: customerDataSource);

    final listCities = await cityRepository.fetchCities();

    final listCustomers = await customerRepository.fetchCustomersByPage();

    emit(
      BlocHomeStateSuccess.from(
        state,
        listCustomers: listCustomers,
      ),
    );
  }
}
