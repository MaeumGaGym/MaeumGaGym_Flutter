import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../component/image_widget.dart';
import '../../../../../core/images.dart';
import '../../../../../core/maeum/maeum_color.dart';
import '../../../../../core/maeum/maeum_text.dart';

class RoutineEmptyWidget extends StatelessWidget {
  const RoutineEmptyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          SizedBox(height: 170.h),
          Container(
            width: 120.w,
            height: 120.h,
            decoration: BoxDecoration(
              color: MaeumColor.gray50,
              borderRadius: BorderRadius.circular(24.r),
            ),
            child: ImageWidget(
              image: Images.iconsNotDesignSysRoutineIcon,
              imageWidth: 75.w,
            ),
          ),
          SizedBox(height: 24.h),
          MaeumText.titleMedium("아직 루틴이 없어요", MaeumColor.gray600),
          SizedBox(height: 12.h),
          MaeumText.bodyMedium("루틴을 추가하여 규칙적으로 운동해 보세요.", MaeumColor.gray500),
        ],
      ),
    );
  }
}
