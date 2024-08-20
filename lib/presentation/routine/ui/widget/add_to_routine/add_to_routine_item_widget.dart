import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maeumgagym_flutter/domain/pose/entity/pose_detail_entity.dart';
import 'package:maeumgagym_flutter/domain/routines/entity/routine_entity.dart';
import 'package:maeumgagym_flutter/presentation/routine/ui/view/add_to_routine_detail_screen.dart';

import '../../../../../core/maeum/maeum_color.dart';
import '../../../../../core/maeum/maeum_navigation.dart';
import '../../../../../core/maeum/maeum_text.dart';

class AddToRoutineItemWidget extends StatelessWidget {
  final RoutineEntity routineData;
  final PoseDetailEntity poseData;

  const AddToRoutineItemWidget({
    super.key,
    required this.routineData,
    required this.poseData,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => MaeumNavigator.push(
        context,
        AddToRoutineDetailScreen(
          routineData: routineData,
          poseData: poseData,
        ),
      ),
      child: Container(
        width: 1.sw - 40.w,
        margin: EdgeInsets.only(bottom: 12.h),
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 18.h),
        decoration: BoxDecoration(
          color: MaeumColor.blue50,
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Routine Name
                MaeumText.labelLarge(
                  routineData.routineName,
                  MaeumColor.black,
                ),

                SizedBox(height: 4.h),

                /// Routine 사용중 / 보관중 | 날짜
                MaeumText.bodySmall(
                  (routineData.routineStatus.isArchived ? "보관중" : "사용중") +
                      (routineData.dayOfWeeks.isNotEmpty
                          ? " | ${routineData.dayOfWeeks.map((str) => str[0]).join(", ")}"
                          : ""),
                  routineData.routineStatus.isArchived
                      ? MaeumColor.gray400
                      : MaeumColor.blue500,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
