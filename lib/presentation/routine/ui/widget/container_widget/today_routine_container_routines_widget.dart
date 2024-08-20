import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maeumgagym_flutter/domain/routines/entity/routines_entity.dart';
import 'package:maeumgagym_flutter/presentation/pose/ui/view/pose_detail_screen.dart';
import 'package:maeumgagym_flutter/presentation/routine/view_model/today_routine/today_routine_page_state_cubit.dart';

import '../../../../../component/image_widget.dart';
import '../../../../../core/images.dart';
import '../../../../../core/maeum/maeum_color.dart';
import '../../../../../core/maeum/maeum_navigation.dart';
import '../../../../../core/maeum/maeum_text.dart';
import '../../../../../domain/routines/entity/routine_entity.dart';
import '../../../../../domain/routines/entity/routine_pose_entity.dart';

class TodayRoutineContainerRoutinesWidget extends StatelessWidget {
  final RoutinesEntity routines;
  final PageController todayRoutinePageController;

  const TodayRoutineContainerRoutinesWidget({
    super.key,
    required this.routines,
    required this.todayRoutinePageController
  });

  @override
  Widget build(BuildContext context) {
    int todayRoutinePageState = context.watch<TodayRoutinePageStateCubit>().state;


    /// 루틴들
    return SizedBox(
      height: 72.h * routines.routines[todayRoutinePageState].routinePoseList.length,
      child: PageView.builder( // page view
        scrollDirection: Axis.horizontal,
        controller: todayRoutinePageController,
        onPageChanged: (value) => context.read<TodayRoutinePageStateCubit>().changeState(value),
        itemCount: routines.routines.length,
        itemBuilder: (_, pageIndex) {
          // 페이지에 따른 루틴들
          final RoutineEntity routinePageData = routines.routines[pageIndex];

          // list view
          return ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: routines.routines[pageIndex].routinePoseList.length,
            itemBuilder: (_, listIndex) {
              // 한 페이지에 있는 각각의 포즈 데이터
              final RoutinePoseEntity pagePoseData = routinePageData.routinePoseList[listIndex];

              return GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () => MaeumNavigator.push(context, PoseDetailScreen(poseId: pagePoseData.pose.id)),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 8.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              // 포즈 사진
                              Container(
                                height: 48.h,
                                width: 48.w,
                                decoration: BoxDecoration(
                                  color: MaeumColor.gray100,
                                  shape: BoxShape.circle,
                                ),
                                child: ImageWidget(
                                  image: pagePoseData.pose.thumbnail,
                                  imageType: ImageType.pngNetwork,
                                ),
                              ),
                              SizedBox(width: 10.w),
                              Column(
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                children: [
                                  // 포즈 이름
                                  MaeumText.titleSmall(
                                    pagePoseData.pose.name,
                                    MaeumColor.black,
                                  ),

                                  SizedBox(height: 2.h),

                                  // 포즈 갯수, 세트 수
                                  MaeumText.bodySmall(
                                    "${pagePoseData.repetitions}개 | ${pagePoseData.sets}세트",
                                    MaeumColor.gray400,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          GestureDetector(
                            child: ImageWidget(
                              image: Images.chevronRight,
                              width: 24.w,
                              height: 24.h,
                              color: MaeumColor.gray200,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
