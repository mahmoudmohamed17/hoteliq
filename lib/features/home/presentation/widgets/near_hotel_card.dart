import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/routing/app_routes.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/extensions.dart';
import '../../../../core/widgets/custom_heart_button.dart';
import '../../../../core/widgets/price_per_night.dart';

class NearHotelCard extends StatelessWidget {
  const new({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.push(AppRoutes.hotelDetails),
      child: SizedBox(
        width: 270.w,
        child: Stack(
          children: [
            Card(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
                    child: Image.asset(
                      AppImages.dummyPic1,
                      height: 180.h,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: _cardInfo(context),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 12.h,
              right: 12.w,
              child: const CircleAvatar(
                backgroundColor: Colors.white,
                radius: 18,
                child: CustomHeartButton(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _cardInfo(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 4.h,
      children: [
        ListTile(
          title: Text(
            'The Aston Vill Hotel',
            style: context.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w600,
            ),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
          subtitle: Text(
            'Alice Springs NT 0870, Australia',
            style: context.textTheme.titleSmall?.copyWith(
              color: context.colorScheme.outline.withValues(alpha: 0.50),
            ),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            spacing: 2.w,
            children: [
              Icon(
                Icons.star_rounded,
                color: context.appColors.rating,
                size: 20.r,
              ),
              Text(
                '5',
                style: context.textTheme.labelLarge?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          contentPadding: EdgeInsets.zero,
        ),
        const PricePerNightWidget(
          price: 200,
        ),
      ],
    );
  }
}
