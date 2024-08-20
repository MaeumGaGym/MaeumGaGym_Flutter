import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maeumgagym_flutter/core/maeum/maeum_navigation.dart';
import 'package:maeumgagym_flutter/core/maeum/maeum_text.dart';
import 'package:maeumgagym_flutter/presentation/pose/ui/view/pose_detail_screen.dart';

import '../../../../../component/image_widget.dart';
import '../../../../../core/images.dart';
import '../../../../../core/maeum/maeum_color.dart';
import '../../../../../domain/routines/entity/routine_pose_entity.dart';

class TodayRoutineListWidget extends StatelessWidget {
  final RoutinePoseEntity routinePoseData;

  const TodayRoutineListWidget({
    super.key,
    required this.routinePoseData,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () => MaeumNavigator.push(context, PoseDetailScreen(poseId: routinePoseData.pose.id)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  /// 루틴 포즈 이미지
                  Container(
                    height: 80.h,
                    width: 80.w,
                    decoration: BoxDecoration(
                      color: MaeumColor.gray25,
                      shape: BoxShape.circle,
                    ),
                    child: ImageWidget(
                      image: routinePoseData.pose.thumbnail,
                      imageType: ImageType.pngNetwork,
                    ),
                  ),

                  SizedBox(width: 18.w),

                  /// 루틴 포즈 운동 횟수와 세트 수
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MaeumText.bodyLarge(
                        routinePoseData.pose.name,
                        MaeumColor.black,
                      ),
                      SizedBox(height: 2.h),
                      MaeumText.bodyMedium(
                        "${routinePoseData.repetitions}개 | ${routinePoseData.sets}세트",
                        MaeumColor.gray400,
                      ),
                    ],
                  ),
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
        ),
        SizedBox(height: 12.h),
      ],
    );
  }
}
