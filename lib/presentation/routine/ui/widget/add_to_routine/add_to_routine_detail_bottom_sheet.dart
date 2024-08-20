import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maeumgagym_flutter/core/enum/bloc_state_enum.dart';
import 'package:maeumgagym_flutter/core/maeum/maeum_color.dart';
import 'package:maeumgagym_flutter/core/maeum/maeum_navigation.dart';
import 'package:maeumgagym_flutter/core/maeum/maeum_text.dart';
import 'package:maeumgagym_flutter/data/routines/dto/request/add_routine_request.dart';
import 'package:maeumgagym_flutter/data/routines/dto/request/exercise_info_request.dart';
import 'package:maeumgagym_flutter/domain/routines/entity/routine_entity.dart';
import 'package:maeumgagym_flutter/domain/routines/entity/routines_entity.dart';
import 'package:maeumgagym_flutter/presentation/routine/view_model/routines/routines_bloc.dart';
import 'package:maeumgagym_flutter/presentation/routine/view_model/routines/routines_event.dart';
import 'package:maeumgagym_flutter/presentation/routine/view_model/today_routine/today_routine_bloc.dart';
import 'package:maeumgagym_flutter/presentation/routine/view_model/today_routine/today_routine_event.dart';

import '../../../view_model/routines/routines_state.dart';

class AddToRoutineDetailBottomSheet extends StatelessWidget {
  final RoutineEntity routineData;
  final int poseId;
  final TextEditingController repetitionsController, setsController;

  const AddToRoutineDetailBottomSheet({
    super.key,
    required this.routineData,
    required this.poseId,
    required this.repetitionsController,
    required this.setsController,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 98.h,
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: MaeumColor.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              MaeumNavigator.pop(context);
              MaeumNavigator.pop(context);
            },
            child: Container(
              alignment: Alignment.center,
              width: (1.sw - 40.w) / 2 - 8.w,
              decoration: BoxDecoration(
                color: MaeumColor.gray50,
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: MaeumText.labelLarge("취소", MaeumColor.black),
            ),
          ),
          BlocBuilder<RoutinesBloc, RoutinesState<RoutinesEntity>>(
            builder: (_, state) {
              if (state.routinesState == BlocStateEnum.loading) {
                return Container(
                  alignment: Alignment.center,
                  width: (1.sw - 40.w) / 2 - 8.w,
                  decoration: BoxDecoration(
                    color: MaeumColor.blue500,
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: CircularProgressIndicator(
                    color: MaeumColor.white,
                  ),
                );
              } else {
                return GestureDetector(
                  onTap: () {
                    /// 원래 routine에 있는 pose들에
                    List<ExerciseInfoRequest> exerciseInfoRequests =
                    routineData.routinePoseList
                        .map((e) => ExerciseInfoRequest(
                      id: e.pose.id,
                      repetitions: e.repetitions,
                      sets: e.sets,
                    ),
                    ).toList();

                    /// 추가하려는 pose추가 후
                    exerciseInfoRequests.add(
                      ExerciseInfoRequest(
                        id: poseId,
                        repetitions: int.parse(repetitionsController.text),
                        sets: int.parse(setsController.text),
                      ),
                    );

                    /// Edit
                    context.read<RoutinesBloc>().add(
                          EditRoutineEvent(
                            routineId: routineData.id,
                            addRoutineRequest: AddEditRoutineRequest(
                              routineName: routineData.routineName,
                              isShared: routineData.routineStatus.isShared,
                              isArchived: routineData.routineStatus.isArchived,
                              exerciseInfoRequestList: exerciseInfoRequests,
                              dayOfWeeks: routineData.dayOfWeeks,
                            ),
                          ),
                        );
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: (1.sw - 40.w) / 2 - 8.w,
                    decoration: BoxDecoration(
                      color: MaeumColor.blue500,
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: MaeumText.labelLarge("완료", MaeumColor.white),
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
