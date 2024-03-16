import 'package:auto_route/auto_route.dart';
import 'package:bricks_app_flutter/src/constants/strings.dart';
import 'package:bricks_app_flutter/src/core/routes/auto_route/auto_route.gr.dart';
import 'package:bricks_app_flutter/src/presentation/bloc/bloc_customer_detail/bloc_customer_detail.dart';
import 'package:bricks_app_flutter/src/presentation/widgets/bricks_avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// {@template CustomerFormView}
/// View of the Customer detail page.
/// {@endtemplate}
class CustomerDetailView extends StatelessWidget {
  /// {@macro HomeView}
  const CustomerDetailView({
    Key? key,
  }) : super(key: key);

// TODO(SAM):

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
                  fontSize: 20.0,
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
                    SizedBox(
                      child: RichText(
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        text: TextSpan(
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                          ),
                          children: [
                            const TextSpan(
                              text: Strings.customerDetailNamePrefix,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            TextSpan(
                              text: fullNameCustomer,
                              style: const TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      child: RichText(
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        text: TextSpan(
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                          ),
                          children: [
                            const TextSpan(
                              text: Strings.customerDetailEmailPrefix,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            TextSpan(
                              text: emailCustomer,
                              style: const TextStyle(fontSize: 18),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      child: RichText(
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        text: TextSpan(
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                          ),
                          children: [
                            const TextSpan(
                              text: Strings.customerDetailCityPrefix,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            TextSpan(
                              text: cityName,
                              style: const TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      // TODO(SAM):   dialog
                      onPressed: () => {
                        context.read<BlocCustomerDetail>().add(
                              BlocCustomerDetailEventDeleteCustomer(
                                idCustomer: idCustomer,
                              ),
                            )
                      },
                      child: const Text(
                        Strings.customerDetailDeleteUserButtonText,
                        style: TextStyle(
                          fontSize: 22,
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
