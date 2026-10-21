import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/extensions.dart';
import '../../../../core/widgets/custom_heart_button.dart';

class HotelOverviewCard extends StatelessWidget {
  const new({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Card(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ClipRRect(
                child: Image.asset(
                  AppImages.dummyPic1,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 6,
                  children: [
                    ListTile(
                      title: Text(
                        'The Aston Vill Hotel',
                        style: context.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
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
                        spacing: 2,
                        children: [
                          Icon(Icons.star_rounded, color: context.appColors.rating),
                          Text(
                            '5',
                            style: context.textTheme.labelLarge?.copyWith(fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                      contentPadding: EdgeInsets.zero,
                    ),
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: '\$200.7',
                            style: context.textTheme.titleMedium?.copyWith(
                              color: context.colorScheme.primary,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          TextSpan(
                            text: AppStrings.perNight,
                            style: context.textTheme.titleSmall?.copyWith(
                              color: context.colorScheme.outline.withValues(alpha: 0.50),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const Positioned(
          top: 16,
          right: 16,
          child: CircleAvatar(
            backgroundColor: Colors.white,
            radius: 22,
            child: CustomHeartButton(),
          ),
        ),
      ],
    );
  }
}
