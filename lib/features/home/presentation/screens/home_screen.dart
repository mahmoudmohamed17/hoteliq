import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/home_app_bar.dart';
import '../widgets/category_tabs.dart';
import '../widgets/hotel_overview_card.dart';

class HomeScreen extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            const HomeAppBar(),
            20.verticalSpace,
            const CategoryTabs(),
            20.verticalSpace,
            const HotelOverviewCard(),
          ],
        ),
      ),
    );
  }
}
