import 'package:flutter/material.dart';

import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/extensions.dart';
import 'popular_hotel_card.dart';

class PopularHotelsWidget extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      spacing: 12,
      children: [
        _header(context),
        Column(
          spacing: 12,
          children: List.generate(5, (_) {
            return const PopularHotelCard();
          }),
        ),
      ],
    );
  }

  Widget _header(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          AppStrings.popularHotel,
          style: context.textTheme.titleLarge,
        ),
        GestureDetector(
          onTap: () {
            // TODO: Navigate to see all
          },
          child: Text(
            AppStrings.seeAll,
            style: context.textTheme.labelMedium?.copyWith(
              color: context.colorScheme.primary,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}
