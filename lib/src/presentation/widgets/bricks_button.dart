import 'package:bricks_app_flutter/src/constants/doubles.dart';
import 'package:flutter/material.dart';

/// {@template BricksButton}
/// Custom button with a title and can be disabled.
/// {@endtemplate}
class BricksButton extends StatelessWidget {
  /// {@macro BricksButton}
  const BricksButton({
    super.key,
    required this.onTap,
    required this.title,
    this.isEnabled = true,
  });

  /// Function that is called when the button is pressed.
  final VoidCallback onTap;

  final bool isEnabled;

  /// Button title.
  final String title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isEnabled ? onTap : null,
      child: Container(
        decoration: BoxDecoration(
          color: isEnabled ? Colors.orange.withOpacity(0.8) : Colors.grey,
          borderRadius: BorderRadius.circular(100),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.5),
              spreadRadius: 4,
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
          border: Border.all(
            width: 1.5,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: Doubles.fontSizeLarge,
            ),
          ),
        ),
      ),
    );
  }
}
