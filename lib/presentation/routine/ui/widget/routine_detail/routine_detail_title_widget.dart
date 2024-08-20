import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maeumgagym_flutter/core/maeum/maeum_color.dart';
import 'package:maeumgagym_flutter/core/maeum/maeum_text.dart';

import '../../../../../component/image_widget.dart';
import '../../../../../core/images.dart';

class RoutineDetailTitleWidget extends StatelessWidget {
  final String routineName;
  final bool isArchived, isShared;
  final List<String> dayOfWeeks;

  const RoutineDetailTitleWidget({
    super.key,
    required this.routineName,
    required this.isShared,
    required this.isArchived,
    required this.dayOfWeeks,
  });

  @override
  Widget build(BuildContext context) {
    String dayOfWeekString = dayOfWeeks.map((str) => str[0]).join(", ");

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MaeumText.titleLarge(routineName, MaeumColor.black),
            SizedBox(height: 12.h),
            Builder(
              builder: (context) {
                if (isArchived) {
                  return MaeumText.bodyMedium(
                    dayOfWeeks.isEmpty ? "보관중" : "보관중 | $dayOfWeekString",
                    MaeumColor.gray400,
                  );
                } else {
                  return MaeumText.bodyMedium(
                    dayOfWeeks.isEmpty ? "사용중" : "사용중 | $dayOfWeekString",
                    MaeumColor.blue500,
                  );
                }
              },
            ),
          ],
        ),
        Builder(
          builder: (_) {
            if (isShared) {
              return Container(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100.r),
                    color: MaeumColor.blue50,
                ),
                child: Row(
                  children: [
                    MaeumText.labelMedium("공유됨", MaeumColor.blue500),
                    SizedBox(width: 8.w),
                    ImageWidget(
                      image: Images.iconsEarth,
                      width: 16.w,
                      color: MaeumColor.blue500,
                    ),
                  ],
                ),
              );
            } else {
              return const SizedBox.shrink();
            }
          },
        )
      ],
    );
  }
}
