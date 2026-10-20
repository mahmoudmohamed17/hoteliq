import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

import '../../../core/utils/app_assets.dart';
import '../../../core/utils/app_strings.dart';
import '../../../core/utils/extensions.dart';
import '../../home/presentation/screens/home_screen.dart';

class MainShellView extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      tabs: [
        _tab(
          context,
          screen: (context) => const HomeScreen(),
          icon: _icon(AppIcons.home, color: context.colorScheme.primary),
          inactiveIcon: _icon(AppIcons.home),
          title: AppStrings.navHome,
        ),
        _tab(
          context,
          screen: (context) => const Placeholder(),
          icon: _icon(AppIcons.calendar, color: context.colorScheme.primary),
          inactiveIcon: _icon(AppIcons.calendar),
          title: AppStrings.navBookings,
        ),
        _tab(
          context,
          screen: (context) => const Placeholder(),
          icon: _icon(AppIcons.bookmark, color: context.colorScheme.primary),
          inactiveIcon: _icon(AppIcons.bookmark),
          title: AppStrings.navSaved,
        ),
        _tab(
          context,
          screen: (context) => const Placeholder(),
          icon: _icon(AppIcons.profile, color: context.colorScheme.primary),
          inactiveIcon: _icon(AppIcons.profile),
          title: AppStrings.navProfile,
        ),
      ],
      navBarBuilder: (navBarConfig) => Style2BottomNavBar(
        navBarConfig: navBarConfig,
        navBarDecoration: NavBarDecoration(
          color: context.colorScheme.surface,
          padding: const EdgeInsets.symmetric(vertical: 12),
        ),
      ),
    );
  }

  PersistentTabConfig _tab(
    BuildContext context, {
    required Widget Function(BuildContext context) screen,
    required Widget icon,
    required Widget inactiveIcon,
    required String title,
  }) {
    return PersistentTabConfig(
      screen: screen(context),
      item: ItemConfig(
        icon: icon,
        inactiveIcon: inactiveIcon,
        title: title,
        // activeForegroundColor: Colors.teal,
        textStyle: context.textTheme.labelMedium!.copyWith(
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }

  Widget _icon(String path, {Color color = Colors.black}) {
    return SvgPicture.asset(
      path,
      colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
    );
  }
}
