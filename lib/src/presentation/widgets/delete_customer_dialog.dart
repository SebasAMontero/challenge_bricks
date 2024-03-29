import 'package:bricks_app_flutter/src/constants/colors.dart';
import 'package:bricks_app_flutter/src/constants/doubles.dart';
import 'package:bricks_app_flutter/src/constants/strings.dart';
import 'package:flutter/material.dart';

/// {@template DeleteCustomerDialog}
/// Alert dialog that ask for confirmation to the user prior to deleting a costumer.
/// {@endtemplate}
class DeleteCustomerDialog extends StatelessWidget {
  /// {@macro DeleteCustomerDialog}
  const DeleteCustomerDialog({
    super.key,
    required this.onTap,
    required this.nameCustomer,
  });

  final VoidCallback onTap;

  final String nameCustomer;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const SizedBox(
        height: 30,
        child: Center(
          child: Text(
            Strings.customerDetailDeleteUserDialogTitle,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: Doubles.fontSizeVeryLarge,
            ),
          ),
        ),
      ),
      content: SizedBox(
        height: 60,
        child: Center(
          child: Text(
            '${Strings.customerDetailDeleteUserDialogConfirmation}$nameCustomer${Strings.commonQuestionMark}',
            style: const TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: Doubles.fontSizeSmall,
            ),
          ),
        ),
      ),
      actions: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: BricksColors.cancel,
              ),
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text(
                  Strings.commonCancel,
                  style: TextStyle(
                    color: BricksColors.whiteFont,
                    fontWeight: FontWeight.w500,
                    fontSize: Doubles.fontSizeLarge,
                  ),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: BricksColors.confirm,
                borderRadius: BorderRadius.circular(20),
              ),
              child: TextButton(
                onPressed: onTap,
                child: const Text(
                  Strings.commonConfirm,
                  style: TextStyle(
                    color: BricksColors.whiteFont,
                    fontWeight: FontWeight.w500,
                    fontSize: Doubles.fontSizeLarge,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
