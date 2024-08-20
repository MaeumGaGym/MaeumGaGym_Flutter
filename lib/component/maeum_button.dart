import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maeumgagym_flutter/core/maeum/maeum_text.dart';

class MaeumButton extends StatelessWidget {
  final double? width, height, borderRadius;
  final String text;
  final Color? color;
  final Color fontColor;
  final Widget? leading;
  final GestureTapCallback? onTap;

  const MaeumButton({
    required this.text,
    required this.fontColor,
    this.width,
    this.height,
    this.color,
    this.leading,
    this.borderRadius,
    this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(borderRadius ?? 0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(right: 8.w),
              child: leading ?? const SizedBox.shrink(),
            ),
            Center(
              child: MaeumText.labelLarge(text, fontColor),
            ),
          ],
        ),
      ),
    );
  }
}