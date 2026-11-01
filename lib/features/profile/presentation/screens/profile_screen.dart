import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/extensions.dart';
import '../../domain/models/profile_tile_model.dart';
import '../wigdets/profile_card.dart';
import '../wigdets/profile_tile.dart';

class ProfileScreen extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    final tiles = ProfileTileModel.tiles(context).take(5).toList();
    final lastTile = ProfileTileModel.tiles(context).last;

    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 24),
          children: [
            const ProfileCard(
              name: 'Mahmoud Mohamed',
              email: 'mahmoud100@gmail.com',
              urlImage: AppImages.logo,
            ),
            Divider(height: 32.h),
            Column(
              spacing: 8,
              children: List.generate(
                tiles.length,
                (index) {
                  final tile = tiles[index];
                  return ProfileTile(model: tile);
                },
              ),
            ),
            Divider(height: 32.h),
            ProfileTile(
              model: lastTile,
              showTrailing: false,
              contentColor: context.colorScheme.error,
            ),
          ],
        ),
      ),
    );
  }
}
