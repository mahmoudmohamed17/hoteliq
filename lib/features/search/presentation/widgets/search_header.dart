import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/extensions.dart';
import '../../../../core/widgets/custom_box_icon.dart';
import '../../../../core/widgets/custom_text_field.dart';

class SearchHeader extends StatelessWidget {
  const new({
    super.key,
    required this._focusNode,
  });

  final FocusNode _focusNode;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 14.w,
      children: [
        Expanded(
          child: CustomTextField(
            focusNode: _focusNode,
            hint: AppStrings.searchHint,
            onChanged: (value) {
              // TODO: Handle the seach with a debouncer later...
            },
            prefixIcon: SvgPicture.asset(
              AppIcons.search,
              fit: BoxFit.scaleDown,
              colorFilter: ColorFilter.mode(context.colorScheme.outline, BlendMode.srcIn),
            ),
          ),
        ),
        CustomBoxIcon(
          iconPath: AppIcons.arrowRight,
          onTap: () => context.pop(),
        ),
      ],
    );
  }
}
