import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/extensions.dart';

class CategoryTabs extends StatefulWidget {
  const new({
    super.key,
  });

  @override
  State<CategoryTabs> createState() => _CategoryTabsState();
}

class _CategoryTabsState extends State<CategoryTabs> {
  final ValueNotifier<int> _activeTab = ValueNotifier(0);

  @override
  void dispose() {
    _activeTab.dispose();
    super.dispose();
  }

  final List<(String, String)> _tabs = [
    (AppStrings.categoryHotel, AppIcons.hotel),
    (AppStrings.categoryHomestay, AppIcons.homestay),
    (AppStrings.categoryApartment, AppIcons.apartment),
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        spacing: 12,
        children: _tabs.map((e) {
          return ValueListenableBuilder(
            valueListenable: _activeTab,
            builder: (context, value, child) {
              return GestureDetector(
                onTap: () {
                  _activeTab.value = _tabs.indexOf(e);
                },
                child: _tab(context, item: e, isActive: value == _tabs.indexOf(e)),
              );
            },
          );
        }).toList(),
      ),
    );
  }

  Widget _tab(BuildContext context, {required (String, String) item, bool isActive = false}) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      decoration: BoxDecoration(
        color: isActive
            ? context.colorScheme.primary
            : context.colorScheme.outlineVariant.withValues(
                alpha: 0.50,
              ),
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        spacing: 8,
        children: [
          SvgPicture.asset(
            item.$2,
            colorFilter: ColorFilter.mode(
              isActive ? context.colorScheme.onPrimary : context.colorScheme.outline,
              BlendMode.srcIn,
            ),
          ),
          Text(
            item.$1,
            style: context.textTheme.labelLarge?.copyWith(
              color: isActive ? context.colorScheme.onPrimary : context.colorScheme.outline,
            ),
          ),
        ],
      ),
    );
  }
}
