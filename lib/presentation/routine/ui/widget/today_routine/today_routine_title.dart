import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../component/image_widget.dart';
import '../../../../../core/images.dart';
import '../../../../../core/maeum/maeum_color.dart';
import '../../../../../core/maeum/maeum_text.dart';
import '../../../../../domain/routines/entity/routine_entity.dart';

class TodayRoutineTitle extends StatelessWidget {
  final RoutineEntity routineData;

  const TodayRoutineTitle({
    super.key,
    required this.routineData,
  });

  @override
  Widget build(BuildContext context) {
    final String dayOfWeekString = routineData.dayOfWeeks.toString().substring(1, routineData.dayOfWeeks.toString().length - 1);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MaeumText.titleLarge('오늘의 루틴', MaeumColor.black),
            SizedBox(height: 12.h),

            /// 루틴 이름과 루틴 요일
            SizedBox(
              width: 180.w,
              child: MaeumText.bodyMedium(
                "${routineData.routineName} | $dayOfWeekString",
                MaeumColor.blue500,
              ),
            ),
          ],
        ),
        /// 완료 미완료 태그
        Container(
          width: 98.w,
          height: 36.h,
          decoration: BoxDecoration(
            color: MaeumColor.gray50,
            borderRadius: BorderRadius.circular(100.r),
          ),
          child: Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                MaeumText.labelMedium(
                  routineData.isCompleted ? '완료' : '미완료',
                  routineData.isCompleted
                      ? MaeumColor.blue500
                      : MaeumColor.gray600,
                ),
                SizedBox(width: 8.w),
                ImageWidget(
                  image: routineData.isCompleted
                      ? Images.iconsCheckCircle
                      : Images.timeClock,
                  width: 16.w,
                  height: 16.h,
                  color: routineData.isCompleted
                      ? MaeumColor.blue500
                      : MaeumColor.gray600,
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
