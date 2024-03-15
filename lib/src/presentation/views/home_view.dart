import 'package:auto_route/auto_route.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_flutter/src/core/routes/auto_route/auto_route.gr.dart';
import 'package:weather_app_flutter/src/presentation/bloc/bloc_home.dart';
import 'package:weather_app_flutter/src/presentation/widgets/customer_card.dart';

/// {@template HomeView}
/// View of the Home page.
/// {@endtemplate}
class HomeView extends StatelessWidget {
  /// {@macro HomeView}
  const HomeView({super.key});
// TODO(SAM): add constant strings
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BlocHome, BlocHomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is BlocHomeStateLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is BlocHomeStateError) {
          return const Center(
            child: Text(
              'An error occurred fetching data.',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w600,
              ),
            ),
          );
        }
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 40.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(
                        child: Text(
                          'Clientes', 
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: GestureDetector(
                          onTap: () =>
                              context.router.push(const CustomerFormRoute()),
                          child: const Icon(
                            Icons.add_circle_outline,
                            color: Colors.blue,
                            size: 25,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
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
                    itemCount: 8,
                    itemBuilder: (context, index) {
                      return CustomerCard(
                        clientName: 'User ${index + 1}',
                        clientEmail: 'user${index + 1}@example.com',
                        clientCity: 'City ${index + 1}',
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
