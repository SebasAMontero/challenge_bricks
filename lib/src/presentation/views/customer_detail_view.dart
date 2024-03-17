import 'package:auto_route/auto_route.dart';
import 'package:bricks_app_flutter/src/constants/doubles.dart';
import 'package:bricks_app_flutter/src/constants/strings.dart';
import 'package:bricks_app_flutter/src/core/routes/auto_route/auto_route.gr.dart';
import 'package:bricks_app_flutter/src/presentation/bloc/bloc_customer_detail/bloc_customer_detail.dart';
import 'package:bricks_app_flutter/src/presentation/widgets/bricks_avatar.dart';
import 'package:bricks_app_flutter/src/presentation/widgets/bricks_rich_text.dart';
import 'package:bricks_app_flutter/src/presentation/widgets/delete_customer_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// {@template CustomerFormView}
/// View of the Customer detail page.
/// {@endtemplate}
class CustomerDetailView extends StatelessWidget {
  /// {@macro CustomerDetailView}
  const CustomerDetailView({
    Key? key,
  }) : super(key: key);

  /// Opens a dialog that warns and asks the user for confirmation prior to
  /// deleting a customer.
  Future<void> _dialogDeleteCustomer({
    required BuildContext context,
    required int idCustomer,
    required String nameCustomer,
  }) {
    return showDialog<void>(
      context: context,
      builder: (_) {
        return BlocProvider.value(
          value: context.read<BlocCustomerDetail>(),
          child: DeleteCustomerDialog(
            nameCustomer: nameCustomer,
            onTap: () => context.read<BlocCustomerDetail>().add(
                  BlocCustomerDetailEventDeleteCustomer(
                    idCustomer: idCustomer,
                  ),
                ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocConsumer<BlocCustomerDetail, BlocCustomerDetailState>(
        listener: (context, state) {
          if (state is BlocCustomerDetailStateDeletedCustomerSuccess) {
            context.router.push(const HomeRoute());
          }
        },
        builder: (context, state) {
          final fullNameCustomer = state.customer?.name ?? '';
          final emailCustomer = state.customer?.email ?? '';
          final cityName = state.customer?.city.name ?? '';
          final customerImageUrl = state.customer?.image;
          final idCustomer = state.customer?.id ?? 0;

          if (state is BlocCustomerDetailStateLoading) {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.deepPurple,
              ),
            );
          }
          if (state is BlocCustomerDetailStateError) {
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
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 60.0,
                    ),
                    BricksAvatar(
                      borderRadius: BorderRadius.circular(100),
                      customerImageUrl: customerImageUrl,
                    ),
                    const SizedBox(height: 20),
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 199, 199, 199)
                            .withOpacity(0.7),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          BricksRichText(
                            prefixText: Strings.customerDetailNamePrefix,
                            detailText: fullNameCustomer,
                          ),
                          const SizedBox(height: 10),
                          BricksRichText(
                            prefixText: Strings.customerDetailEmailPrefix,
                            detailText: emailCustomer,
                          ),
                          const SizedBox(height: 10),
                          BricksRichText(
                            prefixText: Strings.customerDetailCityPrefix,
                            detailText: cityName,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () => _dialogDeleteCustomer(
                        context: context,
                        idCustomer: idCustomer,
                        nameCustomer: fullNameCustomer,
                      ),
                      style: ButtonStyle(
                        side: MaterialStateProperty.all(
                          const BorderSide(color: Colors.black),
                        ),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                      child: const Text(
                        Strings.customerDetailDeleteUserButtonText,
                        style: TextStyle(
                          fontSize: Doubles.fontSizeVeryLarge,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
