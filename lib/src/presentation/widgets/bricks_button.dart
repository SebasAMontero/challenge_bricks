import 'package:flutter/material.dart';

class BricksButton extends StatelessWidget {
  const BricksButton(
      {super.key,
      required this.onTap,
      required this.title,
      this.isEnabled = true});

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
          color: isEnabled ? Colors.purpleAccent : Colors.grey,
          borderRadius: BorderRadius.circular(100),
          border: Border.all(
            width: 1,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(title),
        ),
      ),
    );
  }
}
