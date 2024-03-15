import 'package:auto_route/auto_route.dart';
import 'package:bricks_app_flutter/src/presentation/views/customer_detail_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bricks_app_flutter/src/presentation/bloc/bloc_home.dart';

/// {@template CustomerDetailPage}
/// Home page.
/// {@endtemplate}
@RoutePage()
class CustomerDetailPage extends StatelessWidget {
  /// {@macro CustomerDetailPage}
  const CustomerDetailPage({
    super.key,
    @PathParam('clientName') required this.idClient,
    @PathParam('clientName') required this.clientName,
    @PathParam('clientEmail') required this.clientEmail,
    @PathParam('clientCity') required this.clientCity,
  });

  final int idClient;

  final String clientName;

  final String clientEmail;

  final String clientCity;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<BlocHome>(
      create: (context) => BlocHome(),
      child: Scaffold(
        body: CustomerDetailView(
          clientName: clientName,
          clientEmail: clientEmail,
          clientCity: clientCity,
        ),
      ),
    );
  }
}
