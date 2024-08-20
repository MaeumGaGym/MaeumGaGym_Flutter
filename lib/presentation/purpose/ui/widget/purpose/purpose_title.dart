import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maeumgagym_flutter/core/maeum/maeum_color.dart';
import 'package:maeumgagym_flutter/core/maeum/maeum_text.dart';

class PurposeTitle extends StatelessWidget {
  const PurposeTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MaeumText.titleLarge(
          "목표",
          MaeumColor.black,
        ),
        SizedBox(height: 12.h),
        MaeumText.bodyMedium(
        "나만의 목표를 세워보세요.",
          MaeumColor.gray600,
        ),
      ],
    );
  }
}
