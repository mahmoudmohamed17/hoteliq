import 'package:flutter/material.dart';

import '../../../../core/utils/app_strings.dart';

class ProfileTileModel {
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  ProfileTileModel({required this.title, required this.icon, required this.onTap});

  static List<ProfileTileModel> tiles(BuildContext context) {
    return [
      ProfileTileModel(
        title: AppStrings.myProfile,
        icon: Icons.person_outline_rounded,
        onTap: () {},
      ),
      ProfileTileModel(
        title: AppStrings.myBookings,
        icon: Icons.event_available_rounded,
        onTap: () {},
      ),
      ProfileTileModel(
        title: AppStrings.paymentMethods,
        icon: Icons.credit_card_outlined,
        onTap: () {},
      ),
      ProfileTileModel(
        title: AppStrings.notifications,
        icon: Icons.notifications_none_rounded,
        onTap: () {},
      ),
      ProfileTileModel(
        title: AppStrings.settings,
        icon: Icons.settings,
        onTap: () {},
      ),
      ProfileTileModel(
        title: AppStrings.logout,
        icon: Icons.logout_outlined,
        onTap: () {},
      ),
    ];
  }
}
