import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/extensions.dart';
import '../../../../core/widgets/custom_box_icon.dart';

class HomeAppBar extends StatelessWidget {
  const new({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 4,
          children: [
            Text(
              AppStrings.currentLocation,
              style: context.textTheme.labelMedium?.copyWith(color: context.colorScheme.outline),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              spacing: 8,
              children: [
                SvgPicture.asset(
                  AppIcons.location,
                  colorFilter: ColorFilter.mode(context.colorScheme.primary, BlendMode.srcIn),
                ),
                Text(
                  'Minia, Egypt',
                  style: context.textTheme.labelLarge?.copyWith(fontWeight: FontWeight.w700),
                ),
              ],
            ),
          ],
        ),
        CustomBoxIcon(
          iconPath: AppIcons.notificationBell,
          onTap: () {},
        ),
      ],
    );
  }
}
