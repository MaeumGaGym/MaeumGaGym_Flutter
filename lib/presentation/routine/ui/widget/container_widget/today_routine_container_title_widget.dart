import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../component/image_widget.dart';
import '../../../../../core/images.dart';
import '../../../../../core/maeum/maeum_color.dart';
import '../../../../../core/maeum/maeum_text.dart';

class TodayRoutineContainerTitleWidget extends StatelessWidget {
  final String routineName;
  final bool isComplete;

  const TodayRoutineContainerTitleWidget({
    super.key,
    required this.routineName,
    required this.isComplete,
  });

  @override
  Widget build(BuildContext context) {
    /// 오늘의 루틴이 비어있을때 Title
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  MaeumText.titleMedium(
                    "오늘의 루틴",
                    MaeumColor.black,
                  ),
                  SizedBox(width: 12.w),

                  /// 루틴 완료 했을때 이미지
                  isComplete
                      ? ImageWidget(
                    image: Images.iconsCheckCircle,
                    imageWidth: 24.w,
                    imageHeight: 24.h,
                    color: MaeumColor.blue500,
                  )
                      : const SizedBox.shrink(),
                ],
              ),
              SizedBox(height: 4.h),

              /// 루틴 이름
              MaeumText.bodyMedium(routineName, MaeumColor.gray500),
            ],
          ),
          ImageWidget(
            image: Images.chevronRight,
            width: 24.w,
            height: 24.h,
            color: MaeumColor.gray200,
          ),
        ],
      ),
    );
  }
}
