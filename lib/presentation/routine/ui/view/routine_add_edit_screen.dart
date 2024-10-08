import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maeumgagym_flutter/component/my_scaffold.dart';
import 'package:maeumgagym_flutter/component/pose/presentation/view_model/routine_add_pose_list_state_cubit.dart';
import 'package:maeumgagym_flutter/component/pose/presentation/view_model/routine_add_pose_list_state_model.dart';
import 'package:maeumgagym_flutter/presentation/routine/ui/widget/routine_add_edit/routine_add_edit_pose_list_widget.dart';
import 'package:maeumgagym_flutter/presentation/routine/ui/widget/routine_add_edit/routine_day_of_week_widget.dart';
import 'package:maeumgagym_flutter/presentation/routine/ui/widget/routine_add_edit/routine_title_text_field.dart';
import 'package:maeumgagym_flutter/presentation/routine/view_model/routine_day_of_week_state_cubit.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../../../component/maeum_toast_message.dart';
import '../../../../core/enum/bloc_state_enum.dart';
import '../../../../core/maeum/maeum_navigation.dart';
import '../../../../domain/routines/entity/routine_entity.dart';
import '../../../../domain/routines/entity/routines_entity.dart';
import '../../view_model/routines/routines_bloc.dart';
import '../../view_model/routines/routines_state.dart';
import '../../view_model/today_routine/today_routine_bloc.dart';
import '../../view_model/today_routine/today_routine_event.dart';
import '../widget/routine_add_edit/routine_add_edit_app_bar.dart';
import '../widget/routine_add_edit/routine_add_edit_bottom_sheet.dart';

class RoutineAddEditScreen extends StatefulWidget {
  final String? appBarTitle;
  final bool? inDetail;
  final RoutineEntity? routineData;

  const RoutineAddEditScreen({super.key, this.routineData, this.appBarTitle, this.inDetail});

  @override
  State<RoutineAddEditScreen> createState() => _RoutineAddEditScreenState();
}

class _RoutineAddEditScreenState extends State<RoutineAddEditScreen> {
  late final TextEditingController _routineTitleController;
  late final FocusNode _routineFocusNode;

  @override
  void initState() {
    super.initState();
    _routineTitleController = TextEditingController(text: widget.appBarTitle);
    _routineFocusNode = FocusNode();

    // dayOfWeek 전부 없애기
    context.read<RoutineDayOfWeekStateCubit>().init();

    if(widget.routineData != null){
      /// 원래 가지고 있던 routineData를 가져오는 작업
      List<RoutineAddPoseListStateModel> initList = widget.routineData!.routinePoseList
          .map((e) => RoutineAddPoseListStateModel(
          poseData: e.pose,
          repetitionsController: TextEditingController(text: e.repetitions.toString()),
          setsController: TextEditingController(text: e.sets.toString()))).toList();
      context.read<RoutineAddPoseListStateCubit>().init(initList: initList);
    } else {
      context.read<RoutineAddPoseListStateCubit>().init(initList: []);
    }
  }

  @override
  void dispose() {
    super.dispose();
    _routineTitleController.dispose();
    _routineFocusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isAdd = widget.appBarTitle == null ? true : false;

    return MultiBlocListener(
      listeners: [
        BlocListener<RoutinesBloc, RoutinesState<RoutinesEntity>>(
          listenWhen: (_, current) => current.routinesState == BlocStateEnum.loaded,
          listener: (_, state){
            showTopSnackBar(Overlay.of(context), MaeumToastMessage(title: "루틴을 ${isAdd ? "추가" : "수정"}했어요."));
            context.read<TodayRoutineBloc>().add(GetTodayRoutineEvent());

            MaeumNavigator.pop(context);
            widget.inDetail != null ? MaeumNavigator.pop(context) : null;
          },
        )
      ],
      child: MyScaffold(
        appBar: RoutineAddEditAppBar(appBarTitle: widget.appBarTitle),
        bottomSheet: RoutineAddEditBottomSheet(
          isAdd: isAdd,
          inDetail: widget.inDetail ?? false,
          routineId: widget.routineData != null ? widget.routineData!.id : 0,
          routineTitleController: _routineTitleController,
        ),
        body: SingleChildScrollView(
          // physics: const NeverScrollableScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
            child: Column(
              children: [
                /// 제목 입력 TextField
                RoutineTitleTextField(
                  routineTitleController: _routineTitleController,
                  routineFocusNode: _routineFocusNode,
                ),
          
                SizedBox(height: 32.h),
          
                /// DayOfWeekWidget
                const RoutineDayOfWeekWidget(),
          
                SizedBox(height: 32.h),
          
                /// 추가할 Routine을 모아둔 List
                const RoutineAddEditPoseListWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}