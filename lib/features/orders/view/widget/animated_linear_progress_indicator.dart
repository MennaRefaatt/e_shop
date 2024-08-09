import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/styles/colors.dart';
import '../../get_progress.dart';

class AnimatedLinearProgressIndicator extends StatefulWidget {
  const AnimatedLinearProgressIndicator({super.key, required this.status});
  final String status;

  @override
  State<AnimatedLinearProgressIndicator> createState() =>
      _AnimatedLinearProgressIndicatorState();
}

class _AnimatedLinearProgressIndicatorState
    extends State<AnimatedLinearProgressIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000), // Duration of the animation
    );
    _animation = Tween<double>(
      begin: 0.0,
      end: GetProgress().getProgressValue(widget.status),
    ).animate(_controller);

    _controller.forward(); // Start the animation
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return LinearProgressIndicator(
          value: _animation.value,
          color: GetProgress().getProgressColor(widget.status),
          backgroundColor: AppColors.greyBorder.withOpacity(0.3),
          borderRadius: BorderRadius.circular(20.r),
          minHeight: 7.h,
        );
      },
    );
  }

  @override
  dispose() {
    _controller.dispose();
    super.dispose();
  }
}
