import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/extensions.dart';
import '../../../../core/widgets/custom_text_field.dart';
import '../../../search/presentation/screens/search_screen.dart';

class OpenSearchWidget extends StatelessWidget {
  const new({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return OpenContainer(
      transitionDuration: const Duration(milliseconds: 500),
      closedElevation: 0,
      closedColor: context.theme.scaffoldBackgroundColor,
      openColor: context.theme.scaffoldBackgroundColor,
      useRootNavigator: true,
      openBuilder: (context, action) {
        return const SearchScreen();
      },
      closedBuilder: (context, action) {
        return Material(
          color: Colors.transparent,
          child: IgnorePointer(
            child: CustomTextField(
              hint: AppStrings.searchHint,
              prefixIcon: SvgPicture.asset(
                AppIcons.search,
                fit: BoxFit.scaleDown,
                colorFilter: ColorFilter.mode(context.colorScheme.outline, BlendMode.srcIn),
              ),
            ),
          ),
        );
      },
    );
  }
}
