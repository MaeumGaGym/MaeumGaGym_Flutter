import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class AnimatedCheckButton extends StatelessWidget {
  // animation
  final Curve curves;
  final int duration;
  final bool isCircular, state;
  final double firstWidth, firstHeight;
  final double secondWidth, secondHeight;

  // not animation
  final String route;
  final Widget textWidget;
  final Color color;
  final bool notUseRoute;

  const AnimatedCheckButton({
    required this.state,
    required this.isCircular,
    required this.firstWidth,
    required this.firstHeight,
    required this.secondWidth,
    required this.secondHeight,
    required this.color,
    required this.route,
    required this.textWidget,
    required this.notUseRoute,
    required this.duration,
    required this.curves,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (notUseRoute == false) {
          context.go(route);
        }
      },
      child: AnimatedContainer(
        // animated
        duration: Duration(milliseconds: duration),
        curve: curves,
        // setting
        width: state ? firstWidth.w : secondWidth.w,
        height: state ? firstHeight.h : firstHeight.h,
        decoration: BoxDecoration(
          color: color,
          borderRadius: isCircular
              ? BorderRadius.circular(8.w)
              : BorderRadius.circular(0.w),
        ),
        child: Center(child: textWidget),
      ),
    );
  }
}
