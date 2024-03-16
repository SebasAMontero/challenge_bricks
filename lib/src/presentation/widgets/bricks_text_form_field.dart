import 'package:flutter/material.dart';

/// {@template BricksTextFormField}
/// Custom [TextFormField] that validates user inputs.
/// {@endtemplate}
class BricksTextFormField extends StatefulWidget {
  /// {@macro BricksTextFormField}
  const BricksTextFormField({
    super.key,
    required this.controller,
    required this.validator,
    required this.iconData,
    required this.labelText,
  });

  final String? Function(String?)? validator;

  final TextEditingController controller;

  final IconData iconData;

  final String labelText;

  @override
  State<BricksTextFormField> createState() => _BricksTextFormFieldState();
}

class _BricksTextFormFieldState extends State<BricksTextFormField> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(
            right: 8.0,
          ),
          child: Icon(
            widget.iconData,
          ),
        ),
        Expanded(
          child: TextFormField(
            controller: widget.controller,
            decoration: InputDecoration(
              labelText: widget.labelText,
            ),
            validator: widget.validator,
            autovalidateMode: AutovalidateMode.onUserInteraction,
          ),
        ),
      ],
    );
  }
}
