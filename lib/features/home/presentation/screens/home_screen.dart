import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/home_app_bar.dart';
import '../widgets/category_tabs.dart';
import '../widgets/near_hotels_widget.dart';
import '../widgets/popular_hotels_widget.dart';

class HomeScreen extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 24.0),
          children: [
            const HomeAppBar(),
            24.verticalSpace,
            const CategoryTabs(),
            24.verticalSpace,
            const NearHotelsWidget(),
            24.verticalSpace,
            const PopularHotelsWidget(),
          ],
        ),
      ),
    );
  }
}
