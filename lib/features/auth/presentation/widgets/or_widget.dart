import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/extensions.dart';

class OrWidget extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 12.w,
      children: [
        _divider(),
        Text(
          AppStrings.or,
          style: context.textTheme.labelLarge?.copyWith(
            color: context.colorScheme.outline,
          ),
        ),
        _divider(),
      ],
    );
  }

  Widget _divider() => Expanded(
    child: Divider(
      thickness: 1.5.h,
      endIndent: 14.w,
      indent: 14.w,
    ),
  );
}
