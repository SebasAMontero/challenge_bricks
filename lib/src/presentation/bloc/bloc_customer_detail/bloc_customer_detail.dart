import 'package:bloc/bloc.dart';
import 'package:bricks_app_flutter/src/data/datasources/customer_data_source.dart';
import 'package:bricks_app_flutter/src/data/repositories/city_repository.dart';
import 'package:bricks_app_flutter/src/data/repositories/customer_repository.dart';
import 'package:bricks_app_flutter/src/domain/models/customer/customer.dart';

part 'bloc_customer_detail_state.dart';
part 'bloc_customer_detail_event.dart';

/// {@template BlocCustomerDetail}
/// Handles the state and logic of the CustomerDetailPage
/// {@endtemplate}
class BlocCustomerDetail
    extends Bloc<BlocCustomerDetailEvent, BlocCustomerDetailState> {
  /// {@macro BlocCustomerDetail}
  BlocCustomerDetail({
    this.getCustomerRepository,
    this.getCityRepository,
  }) : super(const BlocCustomerDetailStateInicial()) {
    on<BlocCustomerDetailEventInitialize>(
      _initialize,
    );
    on<BlocCustomerDetailEventDeleteCustomer>(
      _deleteCustomerById,
    );
  }
  final CustomerRepository? getCustomerRepository;
  final CityRepository? getCityRepository;

  /// Initializes data and adds it to the state.
  Future<void> _initialize(
    BlocCustomerDetailEventInitialize event,
    Emitter<BlocCustomerDetailState> emit,
  ) async {
    emit(BlocCustomerDetailStateLoading.from(state));

    final CustomerDataSource customerDataSource = CustomerDataSource();

    // todo(sam): add provider?

    final CustomerRepository customerRepository =
        CustomerRepository(customerDataSource: customerDataSource);
    try {
      final customer = await customerRepository.fetchCustomerById(
        idCustomer: event.idCustomer,
      );

      emit(
        BlocCustomerDetailStateSuccess.from(
          state,
          customer: customer,
        ),
      );
    } catch (error) {
      emit(
        BlocCustomerDetailStateError.from(
          state,
          errorMessage: error.toString(),
        ),
      );
    }
  }

  /// Receives an Id and deletes that customer from the database.
  Future<void> _deleteCustomerById(
    BlocCustomerDetailEventDeleteCustomer event,
    Emitter<BlocCustomerDetailState> emit,
  ) async {
    emit(BlocCustomerDetailStateLoading.from(state));

    final CustomerDataSource customerDataSource = CustomerDataSource();

    // todo(sam): add provider?

    final CustomerRepository customerRepository =
        CustomerRepository(customerDataSource: customerDataSource);
    try {
      await customerRepository.deleteCustomerById(
        idCustomer: event.idCustomer,
      );

      emit(
        BlocCustomerDetailStateDeletedCustomerSuccess.from(
          state,
        ),
      );
    } catch (error) {
      emit(
        BlocCustomerDetailStateError.from(
          state,
          errorMessage: error.toString(),
        ),
      );
    }
  }
}
