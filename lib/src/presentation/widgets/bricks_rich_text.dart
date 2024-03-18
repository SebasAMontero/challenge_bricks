import 'package:bricks_app_flutter/src/constants/colors.dart';
import 'package:bricks_app_flutter/src/constants/doubles.dart';
import 'package:flutter/material.dart';

/// {@template BricksRichText}
/// Custom RichText with a bold prefix text and a suffix text.
/// {@endtemplate}
class BricksRichText extends StatelessWidget {
  /// {@macro BricksRichText}
  const BricksRichText({
    Key? key,
    required this.prefixText,
    required this.detailText,
    this.maxLines = 2,
  }) : super(key: key);

  final String prefixText;
  final String detailText;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: RichText(
        maxLines: maxLines,
        overflow: TextOverflow.ellipsis,
        text: TextSpan(
          style: const TextStyle(
            fontSize: Doubles.fontSizeMedium,
            color: BricksColors.border,
          ),
          children: [
            TextSpan(
              text: prefixText,
              style: const TextStyle(
                fontSize: Doubles.fontSizeMedium,
                fontWeight: FontWeight.w600,
              ),
            ),
            TextSpan(
              text: detailText,
              style: const TextStyle(
                fontSize: Doubles.fontSizeMedium,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
