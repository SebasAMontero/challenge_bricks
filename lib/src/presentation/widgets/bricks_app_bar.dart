import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:bricks_app_flutter/src/core/routes/auto_route/auto_route.gr.dart';

class BricksAppBar extends StatelessWidget implements PreferredSizeWidget {
  const BricksAppBar({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;
  @override
  Size get preferredSize => const Size.fromHeight(100);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Color.fromARGB(255, 0, 0, 0),
                fontSize: 22,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: GestureDetector(
              onTap: () => context.router.push(const CustomerFormRoute()),
              child: const Icon(
                Icons.add_circle_outline,
                color: Colors.blue,
                size: 25,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
