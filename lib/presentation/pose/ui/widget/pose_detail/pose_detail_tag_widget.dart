import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maeumgagym_flutter/core/maeum/maeum_color.dart';
import 'package:maeumgagym_flutter/core/maeum/maeum_text.dart';

class PoseDetailTagWidget extends StatelessWidget {
  final String tagName;

  const PoseDetailTagWidget({super.key, required this.tagName});

  @override
  Widget build(BuildContext context) {
    /// Tag 배경
    return Container(
      decoration: BoxDecoration(
        color: MaeumColor.blue50,
        borderRadius: BorderRadius.circular(100.r),
      ),

      /// Tag 글씨
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        child: MaeumText.labelMedium(tagName, MaeumColor.blue500),
      ),
    );
  }
}