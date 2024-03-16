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
  const HomeView({super.key});
// TODO(SAM): add constant strings
  @override
  Widget build(BuildContext context) {
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
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: MediaQuery.of(context).size.height * 0.23,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 144, 97, 225),
                    border: Border.all(
                      color: Colors.black,
                      width: 1.0,
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      // TODO(SAM):Add total de clientes
                      '20', 
                      style: TextStyle(
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
