import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/extensions.dart';
import '../../../../core/widgets/price_per_night.dart';

class HotelInfo extends StatelessWidget {
  const new({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 8,
      children: [
        Row(
          spacing: 8,
          children: [
            Expanded(
              child: Text(
                'The Aston Vill Hotel',
                style: context.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const PricePerNightWidget(price: 200),
          ],
        ),
        Row(
          spacing: 6,
          children: [
            SvgPicture.asset(
              AppIcons.location,
              height: 20.h,
              width: 20.h,
              colorFilter: ColorFilter.mode(context.colorScheme.primary, BlendMode.srcIn),
            ),
            Expanded(
              child: Text(
                'Alice Springs NT 0870, Australia',
                style: context.textTheme.labelLarge?.copyWith(
                  color: context.colorScheme.outline.withValues(alpha: 0.75),
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
