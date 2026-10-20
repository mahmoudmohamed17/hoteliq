import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/cubits/app_flow_cubit.dart';
import 'core/di/di.dart';
import 'core/routing/app_router.dart';
import 'core/theme/app_theme.dart';

class HoteliqApp extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, _) {
        return BlocProvider(
          create: (context) => getIt<AppFlowCubit>(),
          child: MaterialApp.router(
            debugShowCheckedModeBanner: false,
            theme: AppTheme.light,
            darkTheme: AppTheme.dark,
            themeMode: ThemeMode.light,
            themeAnimationDuration: const Duration(milliseconds: 1500),
            themeAnimationCurve: Curves.fastOutSlowIn,
            routerConfig: AppRouter.router,
          ),
        );
      },
    );
  }
}
