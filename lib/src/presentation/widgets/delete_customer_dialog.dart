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
            'Delete customer',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 24,
            ),
          ),
        ),
      ),
      content: SizedBox(
        height: 60,
        child: Center(
          child: Text(
            'Are you sure you want to\n delete $nameCustomer?',
            style: const TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 16,
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
                  'Cancel',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 212, 127, 127),
                border: Border.all(
                  color: Colors.black,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: TextButton(
                onPressed: onTap,
                child: const Text(
                  'Delete',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
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
