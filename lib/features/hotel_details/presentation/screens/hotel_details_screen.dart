import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_strings.dart';
import '../../../../core/widgets/custom_elevated_button.dart';
import '../widgets/hotel_description.dart';
import '../widgets/hotel_details_app_bar.dart';
import '../widgets/hotel_info.dart';
import '../widgets/hotel_main_image.dart';
import '../widgets/hotel_preview_images.dart';
import '../widgets/hotel_tags.dart';

class HotelDetailsScreen extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 24.0),
          children: [
            const HotelDetailsAppBar(),
            24.verticalSpace,
            const HotelMainImage(),
            18.verticalSpace,
            const HotelTags(),
            24.verticalSpace,
            const HotelInfo(),
            18.verticalSpace,
            const HotelDescription(description: dummyDescription),
            18.verticalSpace,
            const HotelPreviewImages(),
            24.verticalSpace,
            CustomElevatedButton(
              text: AppStrings.bookNow,
              onPressed: () {},
              width: double.infinity,
              height: 56.h,
            ),
          ],
        ),
      ),
    );
  }
}

// TODO: Delete this later...
const dummyDescription = '''
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
''';
