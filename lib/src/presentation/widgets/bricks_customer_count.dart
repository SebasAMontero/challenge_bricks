import 'package:bricks_app_flutter/src/constants/doubles.dart';
import 'package:bricks_app_flutter/src/constants/strings.dart';
import 'package:bricks_app_flutter/src/presentation/bloc/bloc_home/bloc_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// {@template BricksCustomerCount}
/// Container that displays the customer count.
/// {@endtemplate}
class BricksCustomerCount extends StatelessWidget {
  /// {@macro BricksCustomerCount}
  const BricksCustomerCount({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final containerProportionalHeight =
        MediaQuery.of(context).size.height * 0.23;

    final containerProportionalWidth = MediaQuery.of(context).size.width * 0.9;

    return BlocBuilder<BlocHome, BlocHomeState>(
      builder: (context, state) {
        if (state is BlocHomeStateLoading) {
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.deepPurple,
            ),
          );
        }
        return Container(
          width: containerProportionalWidth,
          height: containerProportionalHeight,
          decoration: BoxDecoration(
            color: Colors.deepPurple.withOpacity(0.4),
            border: Border.all(
              color: Colors.black,
              width: 2.0,
            ),
          ),
          child: Center(
            child: Text(
              '${Strings.homeViewCustomerCount}${state.customerCount.toString()}',
              style: const TextStyle(
                fontSize: Doubles.fontSizeHuge,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        );
      },
    );
  }
}
