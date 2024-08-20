import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../component/image_widget.dart';
import '../../../../../core/images.dart';
import '../../../../../core/maeum/maeum_color.dart';
import '../../../../../core/maeum/maeum_text.dart';

class TodayRoutineContainerEmptyView extends StatelessWidget {
  const TodayRoutineContainerEmptyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(12.w, 24.h, 12.w, 16.h),
      decoration: BoxDecoration(
        color: MaeumColor.white,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MaeumText.titleMedium(
                  "오늘의 루틴",
                  MaeumColor.black,
                ),
                ImageWidget(
                  image: Images.chevronRight,
                  width: 24.w,
                  height: 24.h,
                  color: MaeumColor.gray200,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 24.h, bottom: 16.h),
            child: MaeumText.bodyLarge(
              '오늘의 루틴이 없어요',
              MaeumColor.gray400,
            ),
          ),
        ],
      ),
    );
  }
}
