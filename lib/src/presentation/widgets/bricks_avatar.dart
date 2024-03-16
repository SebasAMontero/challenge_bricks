import 'package:bricks_app_flutter/src/constants/assets.dart';
import 'package:flutter/material.dart';

/// {@template BricksAvatar}
/// Custom avatar for the customer.
/// {@endtemplate}
class BricksAvatar extends StatelessWidget {
  /// {@macro BricksAvatar}
  const BricksAvatar({
    super.key,
    required this.borderRadius,
    required this.customerImageUrl,
    this.radius = 50,
    this.width = 100,
    this.height = 100,
  });

  final BorderRadius borderRadius;
  final double? radius;
  final double? width;
  final double? height;
  final String? customerImageUrl;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundColor: Colors.grey,
      child: ClipRRect(
        borderRadius: borderRadius,
        child: customerImageUrl != null
            ? Image.network(
                customerImageUrl!,
                fit: BoxFit.cover,
                width: width,
                height: height,
              )
            : Image.asset(
                Assets.customerPlaceholder,
                fit: BoxFit.cover,
                width: width,
                height: height,
              ),
      ),
    );
  }
}
