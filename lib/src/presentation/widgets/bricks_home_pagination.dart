import 'package:bricks_app_flutter/src/constants/doubles.dart';
import 'package:bricks_app_flutter/src/constants/strings.dart';
import 'package:bricks_app_flutter/src/presentation/bloc/bloc_home/bloc_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// {@template BricksHomePagination}
/// Pagination component of the Home view.
/// {@endtemplate}
class BricksHomePagination extends StatelessWidget {
  /// {@macro BricksHomePagination}
  const BricksHomePagination({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final homeState = context.read<BlocHome>().state;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        IconButton(
          icon: Icon(
            Icons.arrow_left,
            size: Doubles.iconSizeHuge,
            color: (homeState.currentPage == 0) ? Colors.grey : Colors.white,
          ),
          onPressed: () => (homeState.currentPage == 0)
              ? null
              : context.read<BlocHome>().add(
                    const BlocHomeEventPreviousPage(),
                  ),
        ),
        Text(
          '${Strings.homeViewPageNumber}${homeState.currentPage}',
          style: const TextStyle(
            fontSize: Doubles.fontSizeLarge,
            color: Colors.white,
          ),
        ),
        IconButton(
          icon: Icon(
            Icons.arrow_right,
            size: Doubles.iconSizeHuge,
            color: (homeState.numberOfPages - 1 > homeState.currentPage)
                ? Colors.white
                : Colors.grey,
          ),
          onPressed: () => (homeState.numberOfPages - 1 > homeState.currentPage)
              ? context.read<BlocHome>().add(
                    const BlocHomeEventNextPage(),
                  )
              : null,
        ),
      ],
    );
  }
}
