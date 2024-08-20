import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maeumgagym_flutter/core/maeum/maeum_text.dart';

class PoseTabTextWidget extends StatelessWidget {
  final String text;
  final Color color;

  const PoseTabTextWidget({super.key, required this.text, required this.color});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 15.h),
      child: MaeumText.labelLarge(text, color),
    );
  }
}