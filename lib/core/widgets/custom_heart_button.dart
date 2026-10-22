import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../utils/extensions.dart';

class CustomHeartButton extends StatefulWidget {
  final bool initialState;
  final VoidCallback? onTap;
  final ValueChanged<bool>? onChanged;
  final double? size;

  const CustomHeartButton({
    super.key,
    this.initialState = false,
    this.onTap,
    this.onChanged,
    this.size,
  });

  @override
  State<CustomHeartButton> createState() => _CustomHeartButtonState();
}

class _CustomHeartButtonState extends State<CustomHeartButton> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _scaleAnimation;
  late bool _isFavorite;

  @override
  void initState() {
    super.initState();
    _isFavorite = widget.initialState;

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 250),
    );

    _scaleAnimation = TweenSequence<double>([
      TweenSequenceItem(
        tween: Tween(begin: 1.0, end: 1.35).chain(
          CurveTween(
            curve: Curves.easeOut,
          ),
        ),
        weight: 50,
      ),
      TweenSequenceItem(
        tween: Tween(begin: 1.35, end: 1.0).chain(
          CurveTween(
            curve: Curves.easeIn,
          ),
        ),
        weight: 50,
      ),
    ]).animate(_controller);
  }

  @override
  void didUpdateWidget(covariant CustomHeartButton oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.initialState != oldWidget.initialState) {
      setState(() {
        _isFavorite = widget.initialState;
      });
      if (_isFavorite) {
        _controller.forward(from: 0.0);
      }
    }
  }

  void _toggle() {
    setState(() {
      _isFavorite = !_isFavorite;
    });

    _controller.forward(from: 0.0);

    widget.onTap?.call();
    widget.onChanged?.call(_isFavorite);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final activeColor = context.appColors.favorite;
    final inactiveColor = context.colorScheme.outlineVariant;

    return GestureDetector(
      onTap: _toggle,
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: Icon(
          _isFavorite ? Icons.favorite_rounded : Icons.favorite_border_rounded,
          color: _isFavorite ? activeColor : inactiveColor,
          size: widget.size,
        ),
      ),
    );
  }
}
