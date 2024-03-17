import 'package:bricks_app_flutter/src/constants/doubles.dart';
import 'package:bricks_app_flutter/src/constants/strings.dart';
import 'package:bricks_app_flutter/src/presentation/widgets/bricks_customer_count.dart';
import 'package:bricks_app_flutter/src/presentation/widgets/bricks_home_pagination.dart';
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
    return SafeArea(
      child: Column(
        children: [
          const BricksCustomerCount(),
          Expanded(
            child: BlocBuilder<BlocHome, BlocHomeState>(
              builder: (context, state) {
                if (state is BlocHomeStateLoadingPagination) {
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
                        fontSize: Doubles.fontSizeLarge,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  );
                }
                if (state is BlocHomeStateSuccess) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      children: [
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
                        const BricksHomePagination(),
                      ],
                    ),
                  );
                }
                return const SizedBox.shrink();
              },
            ),
          ),
        ],
      ),
    );
  }
}
