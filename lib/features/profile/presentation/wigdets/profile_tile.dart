import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/extensions.dart';
import '../../domain/models/profile_tile_model.dart';

class ProfileTile extends StatelessWidget {
  final ProfileTileModel model;
  final bool showTrailing;
  final Color? contentColor;

  const ProfileTile({
    super.key,
    required this.model,
    this.showTrailing = true,
    this.contentColor,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: model.onTap,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.r),
      ),
      leading: Icon(
        model.icon,
        color: contentColor,
      ),
      title: Text(
        model.title,
        style: context.textTheme.titleSmall?.copyWith(
          color: contentColor,
          fontWeight: showTrailing ? null : FontWeight.bold,
        ),
      ),
      trailing: showTrailing
          ? Icon(
              Icons.arrow_forward_ios,
              size: 16.sp,
              color: context.colorScheme.outline.withValues(alpha: 0.50),
            )
          : null,
    );
  }
}
