import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/extensions.dart';

class ProfileCard extends StatelessWidget {
  final String name;
  final String email;
  final String urlImage;

  const new({
    required this.name,
    required this.email,
    required this.urlImage,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 52.r,
          // TODO: Make it use cached network image later
          backgroundImage: AssetImage(urlImage),
        ),
        12.verticalSpace,
        Text(
          name,
          style: context.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
        ),
        4.verticalSpace,
        Text(
          email,
          style: context.textTheme.labelMedium?.copyWith(
            color: context.colorScheme.outline.withValues(alpha: 0.75),
          ),
        ),
      ],
    );
  }
}
