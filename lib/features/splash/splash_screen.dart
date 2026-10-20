import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/utils/app_assets.dart';
import '../../core/utils/app_strings.dart';
import '../../core/utils/extensions.dart';

class SplashScreen extends StatelessWidget {
  const new({super.key, required this.onFinished});
  final VoidCallback onFinished;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 16,
            children: [
              TweenAnimationBuilder(
                tween: Tween<double>(begin: 0.0, end: 1.0),
                duration: const Duration(milliseconds: 1500),
                curve: Curves.easeInOut,
                builder: (context, value, child) {
                  return Opacity(
                    opacity: value,
                    child: Transform.translate(
                      offset: Offset((1 - value) * 100, 0),
                      child: child,
                    ),
                  );
                },
                child: Image.asset(
                  AppImages.logo,
                  height: 90.h,
                  width: 90.w,
                ),
              ),
              AnimatedTextKit(
                isRepeatingAnimation: false,
                pause: const Duration(milliseconds: 1500),
                onFinished: () => onFinished.call(),
                animatedTexts: [
                  TyperAnimatedText(
                    AppStrings.appTagline,
                    textStyle: context.textTheme.bodyLarge!,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
