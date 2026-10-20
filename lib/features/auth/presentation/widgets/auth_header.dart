import 'package:flutter/material.dart';

import '../../../../core/utils/extensions.dart';

class AuthHeader extends StatelessWidget {
  final String title;
  final String subTitle;

  const new({
    super.key,
    required this.title,
    required this.subTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      spacing: 2,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: context.textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w600),
        ),
        Text(
          subTitle,
          style: context.textTheme.bodyLarge,
        ),
      ],
    );
  }
}
