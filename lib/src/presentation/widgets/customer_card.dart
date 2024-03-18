import 'package:auto_route/auto_route.dart';
import 'package:bricks_app_flutter/src/constants/colors.dart';
import 'package:bricks_app_flutter/src/constants/doubles.dart';
import 'package:bricks_app_flutter/src/core/routes/auto_route/auto_route.gr.dart';
import 'package:bricks_app_flutter/src/domain/models/customer/customer.dart';
import 'package:bricks_app_flutter/src/presentation/widgets/bricks_avatar.dart';
import 'package:flutter/material.dart';

/// {@template CustomerCard}
/// Custom widget with the details of a customer with a card form.
/// {@endtemplate}
class CustomerCard extends StatelessWidget {
  /// {@macro CustomerCard}
  const CustomerCard({
    Key? key,
    required this.customer,
  }) : super(key: key);

  final Customer customer;

  @override
  Widget build(BuildContext context) {
    final double containerProportionalHeight =
        MediaQuery.of(context).size.height * 0.11;

    return GestureDetector(
      onTap: () => context.router.push(
        CustomerDetailRoute(
          idCustomer: customer.id,
        ),
      ),
      child: Container(
        height: containerProportionalHeight,
        padding: const EdgeInsets.symmetric(horizontal: 2.0, vertical: 8.0),
        margin: const EdgeInsets.symmetric(vertical: 8.0),
        decoration: BoxDecoration(
          color: BricksColors.backgroundCardsPurple.withOpacity(0.7),
          border: Border.all(
            color: BricksColors.border,
            width: 2.0,
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 2.0, horizontal: 8),
                  child: BricksAvatar(
                    radius: 30,
                    borderRadius: BorderRadius.zero,
                    customerImageUrl: customer.image,
                    width: 60,
                    height: 60,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      child: Text(
                        customer.name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: Doubles.fontSizeSmall,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    SizedBox(
                      width: 190,
                      child: Text(
                        customer.email,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: Doubles.fontSizeSmall,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(right: 5.0),
              child: SizedBox(
                width: 90,
                child: Text(
                  customer.city.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: Doubles.fontSizeSmall,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
