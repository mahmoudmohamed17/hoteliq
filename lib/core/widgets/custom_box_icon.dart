import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../utils/extensions.dart';

class CustomBoxIcon extends StatelessWidget {
  final String iconPath;
  final VoidCallback onTap;
  final Widget? topWidget;

  const new({
    super.key,
    required this.iconPath,
    required this.onTap,
    this.topWidget,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: context.colorScheme.outlineVariant),
        ),
        padding: const EdgeInsets.all(10),
        child: Stack(
          children: [SvgPicture.asset(iconPath), ?topWidget],
        ),
      ),
    );
  }
}
