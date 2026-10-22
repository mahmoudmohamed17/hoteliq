import 'package:flutter/material.dart';

import '../../../../core/utils/app_strings.dart';
import '../utils/extensions.dart';

class PricePerNightWidget extends StatelessWidget {
  const new({super.key, required this.price});

  final double price;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: '\$$price',
            style: context.textTheme.titleMedium?.copyWith(
              color: context.colorScheme.primary,
              fontWeight: FontWeight.w600,
            ),
          ),
          TextSpan(
            text: AppStrings.perNight,
            style: context.textTheme.titleSmall?.copyWith(
              color: context.colorScheme.outline.withValues(alpha: 0.75),
            ),
          ),
        ],
      ),
    );
  }
}
