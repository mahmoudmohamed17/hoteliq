import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/extensions.dart';
import '../../../../core/widgets/custom_box_icon.dart';

class HotelDetailsAppBar extends StatelessWidget {
  const new({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomBoxIcon(iconPath: AppIcons.arrowLeft, onTap: () => context.pop()),
        Text(
          AppStrings.detail,
          style: context.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
        ),
        CustomBoxIcon(iconPath: AppIcons.more, onTap: () {}),
      ],
    );
  }
}
