import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maeumgagym_flutter/component/maeum_toast_message.dart';
import 'package:maeumgagym_flutter/core/maeum/maeum_color.dart';
import 'package:maeumgagym_flutter/core/maeum/maeum_navigation.dart';
import 'package:maeumgagym_flutter/data/routines/dto/request/add_routine_request.dart';
import 'package:maeumgagym_flutter/data/routines/dto/request/exercise_info_request.dart';
import 'package:maeumgagym_flutter/presentation/routine/ui/view/routine_add_edit_screen.dart';
import 'package:maeumgagym_flutter/presentation/routine/ui/widget/routine_manager_item_widget.dart';
import 'package:maeumgagym_flutter/presentation/routine/view_model/routines/routines_bloc.dart';
import 'package:maeumgagym_flutter/presentation/routine/view_model/routines/routines_event.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

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
    void showToast(String title){
      showTopSnackBar(
        Overlay.of(context),
        MaeumToastMessage(title: title),
      );
    }
    
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
                onTap: () {
                  MaeumNavigator.pop(context);
                  MaeumNavigator.push(
                    context,
                    RoutineAddEditScreen(
                      appBarTitle: routineData.routineName,
                      routineData: routineData,
                    ),
                  );
                },
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
                  showToast(routineData.routineStatus.isArchived ? "루틴 보관을 취소 했어요" : "루틴을 보관했어요.");
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
                  showToast(routineData.routineStatus.isShared ? "루틴 공유를 취소 했어요" : "루틴을 공유했어요.");
                  MaeumNavigator.pop(context);
                },
                title: routineData.routineStatus.isShared ? "공유 취소" : "공유",
                image: Images.iconsEarth,
              ),

              /// 삭제 버튼
              RoutineManagerItemWidget(
                onTap: () {
                  context.read<RoutinesBloc>().add(DelRoutineEvent(routineId: routineData.id));
                  showToast("루틴을 삭제 했어요.");
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
