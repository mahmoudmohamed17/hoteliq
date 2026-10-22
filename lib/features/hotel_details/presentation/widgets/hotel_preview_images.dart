import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/extensions.dart';

class HotelPreviewImages extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 8,
      children: [
        Text(
          AppStrings.preview,
          style: context.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          clipBehavior: Clip.none,
          child: Row(
            spacing: 12,
            children: List.generate(_images.length, (index) => _image(index)),
          ),
        ),
      ],
    );
  }

  List<String> get _images {
    return [
      AppImages.dummyPic1,
      AppImages.dummyPic2,
      AppImages.dummyPic3,
      AppImages.dummyPic4,
    ];
  }

  Widget _image(int index) {
    return ClipRRect(
      borderRadius: BorderRadiusGeometry.circular(16.r),
      child: Image.asset(
        _images[index],
        height: 124.h,
        width: 124.w,
        fit: BoxFit.cover,
      ),
    );
  }
}
