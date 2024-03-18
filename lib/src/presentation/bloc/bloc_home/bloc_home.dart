import 'package:bloc/bloc.dart';
import 'package:bricks_app_flutter/src/constants/doubles.dart';
import 'package:bricks_app_flutter/src/data/repositories/city_repository.dart';
import 'package:bricks_app_flutter/src/data/repositories/customer_repository.dart';
import 'package:bricks_app_flutter/src/domain/models/customer/customer.dart';
import 'package:bricks_app_flutter/src/domain/models/page_customer/page_customer.dart';

part 'bloc_home_state.dart';
part 'bloc_home_event.dart';

/// {@template BlocHome}
/// Handles the state and logic of the HomePage
/// {@endtemplate}
class BlocHome extends Bloc<BlocHomeEvent, BlocHomeState> {
  /// {@macro BlocHome}
  BlocHome({
    required this.customerRepository,
    required this.cityRepository,
  }) : super(const BlocHomeStateInitial()) {
    on<BlocHomeEventInitialize>(_initializeCustomers);
    on<BlocHomeEventPreviousPage>(_previousPage);
    on<BlocHomeEventNextPage>(_nextPage);
  }

  final CustomerRepository customerRepository;
  final CityRepository cityRepository;

  /// Initializes customer data and adds it to the state.
  Future<void> _initializeCustomers(
    BlocHomeEventInitialize event,
    Emitter<BlocHomeState> emit,
  ) async {
    emit(BlocHomeStateLoading.from(state));

    try {
      final customerCount = await customerRepository.fetchCustomerCount();

      final numberOfPages = customerCount / Doubles.pageItemSize;

      final listCustomers = await customerRepository.fetchCustomersByPage(
        currentPage: state.currentPage,
      );

      List<PageCustomer> listPageCustomer = [];

      final pageCustomer = PageCustomer(
        currentPage: state.currentPage,
        listCustomers: listCustomers,
      );

      listPageCustomer.add(pageCustomer);

      emit(
        BlocHomeStateSuccess.from(
          state,
          listCustomers: listCustomers,
          customerCount: customerCount,
          numberOfPages: numberOfPages,
          listPageCustomer: listPageCustomer,
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

  /// Fetches customers from the previous page.
  Future<void> _previousPage(
    BlocHomeEventPreviousPage event,
    Emitter<BlocHomeState> emit,
  ) async {
    emit(BlocHomeStateLoadingPagination.from(state));

    var currentPage = state.currentPage;
    if (currentPage > 0) {
      currentPage--;
    }

    try {
      if (state.listPageCustomer
          .any((pageCustomer) => pageCustomer.currentPage == currentPage)) {
        final pageCustomer = state.listPageCustomer.firstWhere(
            (pageCustomer) => pageCustomer.currentPage == currentPage);

        final custom = pageCustomer.listCustomers;
        final page = pageCustomer.currentPage;
        emit(
          BlocHomeStateSuccess.from(
            state,
            currentPage: page,
            listCustomers: custom,
          ),
        );
      } else {
        final listCustomers = await customerRepository.fetchCustomersByPage(
          currentPage: currentPage,
        );
        List<PageCustomer> listPageCustomer = state.listPageCustomer;

        final pageCustomer = PageCustomer(
          currentPage: currentPage,
          listCustomers: listCustomers,
        );

        listPageCustomer.add(pageCustomer);

        emit(
          BlocHomeStateSuccess.from(
            state,
            currentPage: currentPage,
            listCustomers: listCustomers,
            listPageCustomer: listPageCustomer,
          ),
        );
      }
    } catch (error) {
      emit(
        BlocHomeStateError.from(
          state,
          errorMessage: error.toString(),
        ),
      );
    }
  }

  /// Fetches customers from the next page.
  Future<void> _nextPage(
    BlocHomeEventNextPage event,
    Emitter<BlocHomeState> emit,
  ) async {
    emit(BlocHomeStateLoadingPagination.from(state));

    var currentPage = state.currentPage;

    currentPage++;

    try {
      if (state.listPageCustomer
          .any((pageCustomer) => pageCustomer.currentPage == currentPage)) {
        final pageCustomer = state.listPageCustomer.firstWhere(
            (pageCustomer) => pageCustomer.currentPage == currentPage);
        emit(
          BlocHomeStateSuccess.from(
            state,
            currentPage: currentPage,
            listCustomers: pageCustomer.listCustomers,
          ),
        );
      } else {
        final listCustomers = await customerRepository.fetchCustomersByPage(
          currentPage: currentPage,
        );
        List<PageCustomer> listPageCustomer = state.listPageCustomer;

        final pageCustomer = PageCustomer(
          currentPage: currentPage,
          listCustomers: listCustomers,
        );

        listPageCustomer.add(pageCustomer);
        emit(
          BlocHomeStateSuccess.from(
            state,
            currentPage: currentPage,
            listCustomers: listCustomers,
            listPageCustomer: listPageCustomer,
          ),
        );
      }
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
