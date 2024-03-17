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
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(20),
                color: const Color.fromARGB(255, 208, 207, 207),
              ),
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text(
                  Strings.commonCancel,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: Doubles.fontSizeLarge,
                  ),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 227, 220, 141),
                border: Border.all(
                  color: Colors.black,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: TextButton(
                onPressed: onTap,
                child: const Text(
                  Strings.commonDelete,
                  style: TextStyle(
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
