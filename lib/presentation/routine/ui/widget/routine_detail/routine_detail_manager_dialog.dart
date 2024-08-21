import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maeumgagym_flutter/core/maeum/maeum_color.dart';
import 'package:maeumgagym_flutter/core/maeum/maeum_text.dart';
import 'package:maeumgagym_flutter/domain/routines/entity/routine_entity.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../../../../component/maeum_toast_message.dart';
import '../../../../../core/images.dart';
import '../../../../../core/maeum/maeum_navigation.dart';
import '../../../../../data/routines/dto/request/add_routine_request.dart';
import '../../../../../data/routines/dto/request/exercise_info_request.dart';
import '../../../view_model/routine/routine_bloc.dart';
import '../../../view_model/routine/routine_event.dart';
import '../../../view_model/routines/routines_bloc.dart';
import '../../../view_model/routines/routines_event.dart';
import '../../view/routine_add_edit_screen.dart';
import '../routine_manager_item_widget.dart';

class RoutineDetailManagerDialog extends StatefulWidget {
  final RoutineEntity routineData;

  const RoutineDetailManagerDialog({super.key, required this.routineData});

  @override
  State<RoutineDetailManagerDialog> createState() => _RoutineDetailManagerDialogState();
}

class _RoutineDetailManagerDialogState extends State<RoutineDetailManagerDialog> {
  @override
  Widget build(BuildContext context) {
    RoutineEntity routineData = widget.routineData;

    void showToast(String title){
      showTopSnackBar(
        Overlay.of(context),
        MaeumToastMessage(title: title),
      );
    }

    return Dialog(
      child: Container(
        width: 1.sw - 80.w,
        padding: EdgeInsets.symmetric(vertical: 24.h),
        decoration: BoxDecoration(
          color: MaeumColor.white,
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 24.w),
              child: MaeumText.titleMedium("루틴 설정", MaeumColor.black),
            ),

            SizedBox(height: 12.h),

            /// 수정 버튼
            RoutineManagerItemWidget(
              onTap: () {
                MaeumNavigator.pop(context);
                MaeumNavigator.push(
                  context,
                  RoutineAddEditScreen(
                    appBarTitle: routineData.routineName,
                    routineData: routineData,
                    inDetail: true,
                  ),
                );
              },
              title: "수정",
              image: Images.editPencil,
            ),

            /// 보관 버튼
            RoutineManagerItemWidget(
              onTap: () {
                context.read<RoutineBloc>().add(
                  GetRoutineDetailEvent(
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

                context.read<RoutinesBloc>().add(GetRoutinesInitEvent());
                showToast(routineData.routineStatus.isArchived ? "루틴 보관을 취소 했어요" : "루틴을 보관했어요.");

                MaeumNavigator.pop(context);
              },
              title: routineData.routineStatus.isArchived ? "보관 취소" : "보관",
              image: Images.iconsInbox,
            ),

            /// 공유 버튼
            RoutineManagerItemWidget(
              onTap: () {
                context.read<RoutineBloc>().add(
                  GetRoutineDetailEvent(
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

                context.read<RoutinesBloc>().add(GetRoutinesInitEvent());
                showToast(routineData.routineStatus.isShared ? "루틴 공유를 취소 했어요" : "루틴을 공유했어요.");

                MaeumNavigator.pop(context);
              },
              title: routineData.routineStatus.isShared ? "공유 취소" : "공유",
              image: Images.iconsEarth,
            ),

            /// 삭제 버튼
            RoutineManagerItemWidget(
              onTap: () {
                MaeumNavigator.pop(context);
                MaeumNavigator.pop(context);
                showToast("루틴을 삭제 했어요.");

                context.read<RoutinesBloc>().add(DelRoutineEvent(routineId: routineData.id));
              },
              title: "삭제",
              image: Images.editTrash,
            ),
          ],
        ),
      ),
    );
  }
}