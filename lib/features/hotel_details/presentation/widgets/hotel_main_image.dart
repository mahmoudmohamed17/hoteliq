import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/extensions.dart';
import '../../../../core/widgets/custom_heart_button.dart';

class HotelMainImage extends StatelessWidget {
  const new({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300.h,
      width: double.infinity,
      child: Stack(
        children: [
          Positioned.fill(
            child: ClipRRect(
              borderRadius: BorderRadiusGeometry.circular(20.r),
              child: Image.asset(
                AppImages.dummyPic1,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            right: 16,
            top: 16,
            child: CircleAvatar(
              backgroundColor: context.colorScheme.surface,
              radius: 24.r,
              child: const CustomHeartButton(),
            ),
          ),
        ],
      ),
    );
  }
}
