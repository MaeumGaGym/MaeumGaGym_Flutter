import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maeumgagym_flutter/core/maeum/maeum_color.dart';
import 'package:maeumgagym_flutter/core/maeum/maeum_text.dart';

class RoutineTitle extends StatelessWidget {
  const RoutineTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MaeumText.titleLarge(
          "내 루틴",
          MaeumColor.black,
        ),
        SizedBox(height: 12.h),
        MaeumText.bodyMedium(
        "나만의 루틴을 구성하여\n규칙적인 운동을 해보세요.",
          MaeumColor.gray600,
        ),
      ],
    );
  }
}
