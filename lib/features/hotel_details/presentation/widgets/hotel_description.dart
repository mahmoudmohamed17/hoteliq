import 'package:flutter/material.dart';
import 'package:rich_readmore/rich_readmore.dart';

import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/extensions.dart';

class HotelDescription extends StatelessWidget {
  const HotelDescription({
    super.key,
    required this.description,
    this.trimLines = 3,
  });

  final String description;
  final int trimLines;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 8,
      children: [
        Text(
          AppStrings.description,
          style: context.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
        ),
        RichReadMoreText.fromString(
          text: description.trim(),
          textStyle: context.textTheme.bodyMedium?.copyWith(
            color: context.colorScheme.outline,
          ),
          settings: LineModeSettings(
            trimLines: trimLines,
            trimCollapsedText: AppStrings.readMore,
            trimExpandedText: AppStrings.readLess,
            lessStyle: context.textTheme.bodyMedium?.copyWith(
              color: context.colorScheme.primary,
              fontWeight: FontWeight.w600,
            ),
            moreStyle: context.textTheme.bodyMedium?.copyWith(
              color: context.colorScheme.primary,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}
