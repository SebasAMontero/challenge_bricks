import 'package:auto_route/auto_route.dart';
import 'package:bricks_app_flutter/src/constants/assets.dart';
import 'package:bricks_app_flutter/src/constants/colors.dart';
import 'package:bricks_app_flutter/src/presentation/bloc/bloc_customer_form/bloc_customer_form.dart';
import 'package:bricks_app_flutter/src/presentation/views/customer_form_view.dart';
import 'package:bricks_app_flutter/src/presentation/bloc/bloc_general/bloc_general.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// {@template CustomerFormPage}
/// Customer form page.
/// {@endtemplate}
@RoutePage()
class CustomerFormPage extends StatelessWidget {
  /// {@macro CustomerFormPage}
  const CustomerFormPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cityRepository = context.read<BlocGeneral>().state.cityRepository;
    final customerRepository =
        context.read<BlocGeneral>().state.customerRepository;

    return BlocProvider<BlocCustomerForm>(
      create: (context) => BlocCustomerForm(
        customerRepository: customerRepository,
        cityRepository: cityRepository,
      )..add(
          const BlocCustomerFormEventInitialize(),
        ),
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                Assets.sunnyBackground,
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: const CustomerFormView(),
        ),
        backgroundColor: BricksColors.backgroundColor,
      ),
    );
  }
}
