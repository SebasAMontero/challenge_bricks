import 'package:bricks_app_flutter/src/constants/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bricks_app_flutter/src/presentation/bloc/bloc_home/bloc_home.dart';
import 'package:bricks_app_flutter/src/presentation/widgets/customer_card.dart';

/// {@template HomeView}
/// View of the Home page.
/// {@endtemplate}
class HomeView extends StatelessWidget {
  /// {@macro HomeView}
  const HomeView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final containerProportionalHeight =
        MediaQuery.of(context).size.height * 0.23;

    final containerProportionalWidth = MediaQuery.of(context).size.width * 0.9;

    return SafeArea(
      child: BlocBuilder<BlocHome, BlocHomeState>(
        builder: (context, state) {
          if (state is BlocHomeStateLoading) {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.deepPurple,
              ),
            );
          }
          if (state is BlocHomeStateError) {
            return const Center(
              child: Text(
                Strings.errorFetchingData,
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            );
          }
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                Container(
                  width: containerProportionalWidth,
                  height: containerProportionalHeight,
                  decoration: BoxDecoration(
                    color: Colors.deepPurple.withOpacity(0.4),
                    border: Border.all(
                      color: Colors.black,
                      width: 1.0,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      '${Strings.homePageCustomerCount}${state.customerCount.toString()}',
                      style: const TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: state.listCustomers.length,
                    itemBuilder: (context, index) {
                      return CustomerCard(
                        customer: state.listCustomers[index],
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
