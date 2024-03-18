import 'package:bricks_app_flutter/src/constants/colors.dart';
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
    required this.currentPage,
    required this.numberOfPages,
  });

  final int currentPage;
  final double numberOfPages;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        IconButton(
          icon: Icon(
            Icons.arrow_left,
            size: Doubles.iconSizeHuge,
            color: (currentPage == 0)
                ? BricksColors.disabled
                : BricksColors.whiteFont,
          ),
          onPressed: () => (currentPage == 0)
              ? null
              : context.read<BlocHome>().add(
                    const BlocHomeEventPreviousPage(),
                  ),
        ),
        Text(
          '${Strings.homeViewPageNumber}$currentPage',
          style: const TextStyle(
            fontSize: Doubles.fontSizeLarge,
            color: BricksColors.whiteFont,
          ),
        ),
        IconButton(
          icon: Icon(
            Icons.arrow_right,
            size: Doubles.iconSizeHuge,
            color: (numberOfPages - 1 > currentPage)
                ? BricksColors.whiteFont
                : BricksColors.disabled,
          ),
          onPressed: () => (numberOfPages - 1 > currentPage)
              ? context.read<BlocHome>().add(
                    const BlocHomeEventNextPage(),
                  )
              : null,
        ),
      ],
    );
  }
}
