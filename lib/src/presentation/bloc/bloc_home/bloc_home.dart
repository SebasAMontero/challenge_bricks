import 'package:bloc/bloc.dart';
import 'package:bricks_app_flutter/src/data/datasources/customer_data_source.dart';
import 'package:bricks_app_flutter/src/data/repositories/city_repository.dart';
import 'package:bricks_app_flutter/src/data/repositories/customer_repository.dart';
import 'package:bricks_app_flutter/src/domain/models/customer/customer.dart';

part 'bloc_home_state.dart';
part 'bloc_home_event.dart';

/// {@template BlocHome}
/// Handles the state and logic of the HomePage
/// {@endtemplate}
class BlocHome extends Bloc<BlocHomeEvent, BlocHomeState> {
  /// {@macro BlocHome}
  BlocHome({this.getCustomerRepository, this.getCityRepository})
      : super(const BlocHomeStateInicial()) {
    on<BlocHomeEventInitialize>(
      _initializeCustomers,
    );
  }
  final CustomerRepository? getCustomerRepository;
  final CityRepository? getCityRepository;

  /// Initializes data and adds it to the state.
  Future<void> _initializeCustomers(
    BlocHomeEventInitialize event,
    Emitter<BlocHomeState> emit,
  ) async {
    emit(BlocHomeStateLoading.from(state));

    final CustomerDataSource customerDataSource = CustomerDataSource();

    // todo(sam): add provider?

    final CustomerRepository customerRepository =
        CustomerRepository(customerDataSource: customerDataSource);
    try {
      final listCustomers = await customerRepository.fetchCustomersByPage();

      final customerCount = await customerRepository.fetchCustomerCount();

      emit(
        BlocHomeStateSuccess.from(
          state,
          listCustomers: listCustomers,
          customerCount: customerCount,
        ),
      );
    } catch (error) {
      emit(
        BlocHomeStateError.from(
          state,
          errorMessage: error.toString(),
        ),
      );
    }
  }
}
