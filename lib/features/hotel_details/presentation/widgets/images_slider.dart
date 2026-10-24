import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ImagesSlider extends StatefulWidget {
  final List<String> urlImages;

  const ImagesSlider({super.key, required this.urlImages});

  @override
  State<ImagesSlider> createState() => _ImagesSliderState();
}

class _ImagesSliderState extends State<ImagesSlider> {
  final ValueNotifier<int> _currentIndex = ValueNotifier<int>(0);

  @override
  void dispose() {
    _currentIndex.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        spacing: 16,
        children: [
          SizedBox(
            height: 320.h,
            child: PageView.builder(
              itemCount: widget.urlImages.length,
              itemBuilder: (_, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  // TODO: Change this to use Image.network later or CachedNetworkImage instead
                  child: Image.asset(
                    widget.urlImages[index],
                    fit: BoxFit.cover,
                  ),
                );
              },
              onPageChanged: (index) => _currentIndex.value = index,
            ),
          ),
          ValueListenableBuilder(
            valueListenable: _currentIndex,
            builder: (_, current, _) => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 12,
              children: List.generate(
                widget.urlImages.length,
                (index) => AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  width: current == index ? 32.w : 22.w,
                  height: 7.h,
                  decoration: BoxDecoration(
                    color: current == index ? Colors.white : Colors.white54,
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
