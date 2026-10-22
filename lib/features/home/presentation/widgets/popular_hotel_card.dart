import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/extensions.dart';

class PopularHotelCard extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          spacing: 10,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.r),
                child: Image.asset(
                  AppImages.dummyPic1,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: _cardInfo(context),
            ),
          ],
        ),
      ),
    );
  }

  Widget _cardInfo(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 4.h,
      children: [
        ListTile(
          title: Text(
            'The Aston Vill Hotel',
            style: context.textTheme.titleSmall?.copyWith(
              fontWeight: FontWeight.w600,
            ),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
          subtitle: Text(
            'Alice Springs NT 0870, Australia',
            style: context.textTheme.bodySmall?.copyWith(
              color: context.colorScheme.outline.withValues(alpha: 0.50),
            ),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            spacing: 2.w,
            children: [
              Icon(
                Icons.star_rounded,
                color: context.appColors.rating,
                size: 20.r,
              ),
              Text(
                '5',
                style: context.textTheme.labelLarge?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          contentPadding: EdgeInsets.zero,
        ),
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: '\$200.7',
                style: context.textTheme.titleMedium?.copyWith(
                  color: context.colorScheme.primary,
                  fontWeight: FontWeight.w600,
                ),
              ),
              TextSpan(
                text: AppStrings.perNight,
                style: context.textTheme.titleSmall?.copyWith(
                  color: context.colorScheme.outline.withValues(alpha: 0.50),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
