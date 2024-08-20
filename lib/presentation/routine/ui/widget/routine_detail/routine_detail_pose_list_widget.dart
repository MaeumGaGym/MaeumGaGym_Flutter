import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maeumgagym_flutter/domain/routines/entity/routine_entity.dart';

import '../../../../../component/image_widget.dart';
import '../../../../../core/images.dart';
import '../../../../../core/maeum/maeum_color.dart';
import '../../../../../core/maeum/maeum_navigation.dart';
import '../../../../../core/maeum/maeum_text.dart';
import '../../../../pose/ui/view/pose_detail_screen.dart';

class RoutineDetailPoseListWidget extends StatelessWidget {
  final RoutineEntity routineData;

  const RoutineDetailPoseListWidget({
    super.key,
    required this.routineData,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: routineData.routinePoseList.length,
      itemBuilder: (context, index) {
        final routinePoseData = routineData.routinePoseList[index];

        return Padding(
          padding: EdgeInsets.only(bottom: 12.h),
          child: GestureDetector(
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
        );
      },
    );
  }
}
