import 'package:auto_route/auto_route.dart';
import 'package:bricks_app_flutter/src/presentation/bloc/bloc_customer_form/bloc_customer_form.dart';
import 'package:bricks_app_flutter/src/presentation/views/customer_form_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// {@template CustomerFormPage}
/// Home page.
/// {@endtemplate}
@RoutePage()
class CustomerFormPage extends StatelessWidget {
  /// {@macro CustomerFormPage}
  const CustomerFormPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<BlocCustomerForm>(
      create: (context) => BlocCustomerForm()
        ..add(
          const BlocCustomerFormEventInitialize(),
        ),
      child: const Scaffold(
        body: CustomerFormView(),
        backgroundColor: Color.fromARGB(237, 241, 240, 240),
      ),
    );
  }
}
