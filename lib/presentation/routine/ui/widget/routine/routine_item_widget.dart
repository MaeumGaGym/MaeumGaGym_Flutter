import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maeumgagym_flutter/core/maeum/maeum_color.dart';
import 'package:maeumgagym_flutter/core/maeum/maeum_navigation.dart';
import 'package:maeumgagym_flutter/core/maeum/maeum_text.dart';
import 'package:maeumgagym_flutter/domain/routines/entity/routine_entity.dart';
import 'package:maeumgagym_flutter/presentation/routine/ui/view/routine_detail_screen.dart';
import 'package:maeumgagym_flutter/presentation/routine/ui/widget/routine/routine_manager_bottom_sheet.dart';

import '../../../../../component/image_widget.dart';
import '../../../../../core/images.dart';

class RoutineItemWidget extends StatelessWidget {
  final RoutineEntity routineData;

  const RoutineItemWidget({
    super.key,
    required this.routineData,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => MaeumNavigator.push(context, RoutineDetailScreen(routineId: routineData.id)),
      child: Container(
        width: 1.sw - 40.w,
        margin: EdgeInsets.only(bottom: 12.h),
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 18.h),
        decoration: BoxDecoration(
          color: MaeumColor.blue50,
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
            Row(
              children: [
                /// 공유됨 Widget
                Builder(
                  builder: (context) {
                    if (routineData.routineStatus.isShared) {
                      return Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 16.w, vertical: 8.h),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16.r),
                            color: MaeumColor.white),
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
                      return const SizedBox();
                    }
                  },
                ),
                SizedBox(width: 12.w),

                /// 점 세개 아이콘 + BottomSheet
                GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (_) {
                        return RoutineManagerBottomSheet(
                          routineData: routineData,
                        );
                      },
                    );
                  },
                  child: ImageWidget(
                    width: 24.w,
                    height: 24.h,
                    image: Images.iconsDotsVertical,
                    color: MaeumColor.gray400,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
