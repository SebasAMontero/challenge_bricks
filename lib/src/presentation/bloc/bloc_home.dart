import 'package:bloc/bloc.dart';
import 'package:bricks_app_flutter/src/domain/models/city/city.dart';
import 'package:bricks_app_flutter/src/domain/models/customer/customer.dart';

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
    emit(BlocHomeStateLoading.from(state));
// TODO(SAM): call endpoint get
    final listCustomers = [
      Customer(
        id: 1,
        name: 'John Doe',
        email: 'john.doe@example.com',
        image: 'john_doe.jpg',
        city: const City(id: 1, name: 'LA'),
        createdAt: DateTime.now(),
      ),
      Customer(
        id: 2,
        name: 'Jane Smith',
        email: 'jane.smith@example.com',
        image: 'jane_smith.jpg',
        city: const City(id: 2, name: 'New york'),
        createdAt: DateTime.now(),
      ),
      Customer(
        id: 3,
        name: 'Michael Johnson',
        email: 'michael.johnson@example.com',
        image: 'michael_johnson.jpg',
        city: const City(id: 3, name: 'Chicago'),
        createdAt: DateTime.now(),
      ),
      Customer(
        id: 4,
        name: 'Emily Brown',
        email: 'emily.brown@example.com',
        image: 'emily_brown.jpg',
        city: const City(id: 4, name: 'Seattle'),
        createdAt: DateTime.now(),
      ),
      Customer(
        id: 5,
        name: 'Christopher Lee',
        email: 'christopher.lee@example.com',
        image: 'christopher_lee.jpg',
        city: const City(id: 5, name: 'Charlotte'),
        createdAt: DateTime.now(),
      ),
      Customer(
        id: 6,
        name: 'Emma Wilson',
        email: 'emma.wilson@example.com',
        image: 'emma_wilson.jpg',
        city: const City(id: 6, name: 'Detroid'),
        createdAt: DateTime.now(),
      ),
      Customer(
        id: 7,
        name: 'Daniel Taylor',
        email: 'daniel.taylor@example.com',
        image: 'daniel_taylor.jpg',
        city: const City(id: 7, name: 'Indianapolis'),
        createdAt: DateTime.now(),
      ),
      Customer(
        id: 8,
        name: 'Olivia Martinez',
        email: 'olivia.martinez@example.com',
        image: 'olivia_martinez.jpg',
        city: const City(id: 8, name: 'Detroid'),
        createdAt: DateTime.now(),
      ),
      Customer(
        id: 9,
        name: 'William Anderson',
        email: 'william.anderson@example.com',
        image: 'william_anderson.jpg',
        city: const City(id: 9, name: 'Detroid'),
        createdAt: DateTime.now(),
      ),
      Customer(
        id: 10,
        name: 'Sophia Thomas',
        email: 'sophia.thomas@example.com',
        image: 'sophia_thomas.jpg',
        city: const City(id: 10, name: 'Columbus'),
        createdAt: DateTime.now(),
      ),
    ];
    emit(BlocHomeStateSuccess.from(
      state,
      listCustomers: listCustomers,
    ));
  }
}
