import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/extensions.dart';

class HotelTags extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      runAlignment: WrapAlignment.spaceBetween,
      children: _tagsList.map((e) => _tag(context, icon: e.$1, title: e.$2, iconColor: e.$3)).toList(),
    );
  }

  List<(IconData, String, Color?)> get _tagsList {
    return [
      (Icons.wifi, AppStrings.freeWifi, null),
      (Icons.coffee, AppStrings.freeBreakfast, null),
      (Icons.star_rounded, '5', Colors.amber),
    ];
  }

  Widget _tag(BuildContext context, {required IconData icon, required String title, Color? iconColor}) {
    return Container(
      decoration: BoxDecoration(
        color: context.colorScheme.inversePrimary.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(8.r),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        spacing: 6,
        children: [
          Icon(
            icon,
            size: 20.sp,
            color: iconColor,
          ),
          Text(
            title,
            style: context.textTheme.labelLarge?.copyWith(fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
