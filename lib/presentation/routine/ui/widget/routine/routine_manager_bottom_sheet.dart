import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maeumgagym_flutter/core/maeum/maeum_color.dart';
import 'package:maeumgagym_flutter/core/maeum/maeum_navigation.dart';
import 'package:maeumgagym_flutter/data/routines/dto/request/add_routine_request.dart';
import 'package:maeumgagym_flutter/data/routines/dto/request/exercise_info_request.dart';
import 'package:maeumgagym_flutter/presentation/routine/ui/view/routine_add_edit_screen.dart';
import 'package:maeumgagym_flutter/presentation/routine/ui/widget/routine_manager_item_widget.dart';
import 'package:maeumgagym_flutter/presentation/routine/view_model/routines/routines_bloc.dart';
import 'package:maeumgagym_flutter/presentation/routine/view_model/routines/routines_event.dart';

import '../../../../../core/images.dart';
import '../../../../../domain/routines/entity/routine_entity.dart';

class RoutineManagerBottomSheet extends StatelessWidget {
  final RoutineEntity routineData;

  const RoutineManagerBottomSheet({
    super.key,
    required this.routineData,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.sw,
      decoration: BoxDecoration(
        color: MaeumColor.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10.0.r),
          topRight: Radius.circular(10.0.r),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 10.h),

          /// 맨 위 회색 바
          Container(
            width: 64.w,
            height: 5.h,
            decoration: BoxDecoration(
              color: MaeumColor.gray300,
              borderRadius: BorderRadius.circular(2.r),
            ),
          ),

          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              /// 수정 버튼
              RoutineManagerItemWidget(
                onTap: () => MaeumNavigator.push(
                  context,
                  RoutineAddEditScreen(
                    appBarTitle: routineData.routineName,
                    routineData: routineData,
                  ),
                ),
                title: "수정",
                image: Images.editPencil,
              ),

              /// 보관 버튼
              RoutineManagerItemWidget(
                onTap: () {
                  context.read<RoutinesBloc>().add(
                    EditRoutineEvent(
                          routineId: routineData.id,
                          addRoutineRequest: AddEditRoutineRequest(
                            routineName: routineData.routineName,
                            dayOfWeeks: routineData.dayOfWeeks,
                            exerciseInfoRequestList: routineData.routinePoseList
                                .map((e) => ExerciseInfoRequest(
                                    id: e.pose.id,
                                    repetitions: e.repetitions,
                                    sets: e.sets,
                                  ),
                                ).toList(),
                            isArchived: !routineData.routineStatus.isArchived,
                            isShared: routineData.routineStatus.isShared,
                          ),
                        ),
                      );
                  MaeumNavigator.pop(context);
                },
                title: routineData.routineStatus.isArchived ? "보관 취소" : "보관",
                image: Images.iconsInbox,
              ),

              /// 공유 버튼
              RoutineManagerItemWidget(
                onTap: () {
                  context.read<RoutinesBloc>().add(
                    EditRoutineEvent(
                      routineId: routineData.id,
                      addRoutineRequest: AddEditRoutineRequest(
                        routineName: routineData.routineName,
                        dayOfWeeks: routineData.dayOfWeeks,
                        exerciseInfoRequestList: routineData.routinePoseList
                            .map((e) => ExerciseInfoRequest(
                          id: e.pose.id,
                          repetitions: e.repetitions,
                          sets: e.sets,
                        ),
                        ).toList(),
                        isArchived: routineData.routineStatus.isArchived,
                        isShared: !routineData.routineStatus.isShared,
                      ),
                    ),
                  );
                  MaeumNavigator.pop(context);
                },
                title: routineData.routineStatus.isShared ? "공유 취소" : "공유",
                image: Images.iconsEarth,
              ),

              /// 삭제 버튼
              RoutineManagerItemWidget(
                onTap: () {
                  context.read<RoutinesBloc>().add(DelRoutineEvent(routineId: routineData.id));
                  MaeumNavigator.pop(context);
                },
                title: "삭제",
                image: Images.editTrash,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
