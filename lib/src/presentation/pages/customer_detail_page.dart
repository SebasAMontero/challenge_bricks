import 'package:auto_route/auto_route.dart';
import 'package:bricks_app_flutter/src/constants/assets.dart';
import 'package:bricks_app_flutter/src/presentation/bloc/bloc_customer_detail/bloc_customer_detail.dart';
import 'package:bricks_app_flutter/src/presentation/views/customer_detail_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// {@template CustomerDetailPage}
/// Customer detail page.
/// {@endtemplate}
@RoutePage()
class CustomerDetailPage extends StatelessWidget {
  /// {@macro CustomerDetailPage}
  const CustomerDetailPage({
    super.key,
    @PathParam('idCostumer') required this.idCustomer,
  });

  final int idCustomer;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<BlocCustomerDetail>(
      create: (context) => BlocCustomerDetail()
        ..add(
          BlocCustomerDetailEventInitialize(
            idCustomer: idCustomer,
          ),
        ),
      child: Scaffold(
        backgroundColor: const Color.fromARGB(237, 241, 240, 240),
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                Assets.background,
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: const CustomerDetailView(),
        ),
      ),
    );
  }
}
