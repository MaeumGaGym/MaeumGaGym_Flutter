import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maeumgagym_flutter/component/image_widget.dart';
import 'package:maeumgagym_flutter/component/maeum_button.dart';
import 'package:maeumgagym_flutter/presentation/routine/view_model/routine/routine_bloc.dart';
import 'package:maeumgagym_flutter/presentation/routine/view_model/routine/routine_event.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'package:maeumgagym_flutter/component/maeum_toast_message.dart';
import 'package:maeumgagym_flutter/component/pose/presentation/view_model/routine_add_pose_list_state_cubit.dart';
import 'package:maeumgagym_flutter/core/images.dart';
import 'package:maeumgagym_flutter/core/maeum/maeum_color.dart';
import 'package:maeumgagym_flutter/core/maeum/maeum_navigation.dart';
import 'package:maeumgagym_flutter/data/routines/dto/request/add_routine_request.dart';
import 'package:maeumgagym_flutter/presentation/routine/ui/view/routine_add_pose_screen.dart';
import 'package:maeumgagym_flutter/presentation/routine/view_model/routine_day_of_week_state_cubit.dart';
import 'package:maeumgagym_flutter/presentation/routine/view_model/routines/routines_bloc.dart';
import 'package:maeumgagym_flutter/presentation/routine/view_model/routines/routines_event.dart';

class RoutineAddEditBottomSheet extends StatelessWidget {
  final bool isAdd, inDetail;
  final int routineId;
  final TextEditingController routineTitleController;

  const RoutineAddEditBottomSheet({
    super.key,
    required this.isAdd,
    required this.inDetail,
    required this.routineId,
    required this.routineTitleController,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.sw,
      height: 98.h,
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(border: Border(top: BorderSide(color: MaeumColor.gray50))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () => MaeumNavigator.push(context, const RoutineAddPoseScreen()),
            child: MaeumButton(
              width: (1.sw - 40.w) / 2 - 4,
              height: 58.h,
              leading: ImageWidget(image: Images.editAdd, width: 24.w),
              text: "자세 추가",
              fontColor: MaeumColor.black,
              color: MaeumColor.gray50,
              borderRadius: 8.r,
            ),
          ),
          GestureDetector(
            onTap: () {
              if (routineTitleController.text.isNotEmpty &&
                  routineTitleController.text.length <= 10 &&
                  context.read<RoutineDayOfWeekStateCubit>().toRequest().isNotEmpty &&
                  context.read<RoutineAddPoseListStateCubit>().toRequest().isNotEmpty) {

                /// Request
                AddEditRoutineRequest request = AddEditRoutineRequest(
                  routineName: routineTitleController.text,
                  dayOfWeeks: context
                      .read<RoutineDayOfWeekStateCubit>()
                      .toRequest(),
                  exerciseInfoRequestList: context
                      .read<RoutineAddPoseListStateCubit>()
                      .toRequest(),
                  isArchived: false,
                  isShared: false,
                );

                /// 호출
                if(isAdd){
                  context.read<RoutinesBloc>().add(AddRoutineEvent(addRoutineRequest: request));
                } else {
                  if(inDetail){
                    context.read<RoutineBloc>().add(
                          GetRoutineDetailEvent(
                            routineId: routineId,
                            addRoutineRequest: request,
                          ),
                        );
                    context.read<RoutinesBloc>().add(GetRoutinesInitEvent());
                  } else {
                    context.read<RoutinesBloc>().add(
                          EditRoutineEvent(
                            routineId: routineId,
                            addRoutineRequest: request,
                          ),
                        );
                  }
                }
              } else {
                showTopSnackBar(
                  Overlay.of(context),
                  MaeumToastMessage(
                    title: "루틴을 ${isAdd ? "추가" : "수정"}할 수 없어요",
                    isError: true,
                  ),
                );
              }
            },
            child: MaeumButton(
              width: (1.sw - 40.w) / 2 - 4,
              height: 58.h,
              text: "완료",
              fontColor: MaeumColor.white,
              color: MaeumColor.blue500,
              borderRadius: 8.r,
            ),
          ),
        ],
      ),
    );
  }
}
