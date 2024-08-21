import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maeumgagym_flutter/component/maeum_toast_message.dart';
import 'package:maeumgagym_flutter/component/my_scaffold.dart';
import 'package:maeumgagym_flutter/core/enum/bloc_state_enum.dart';
import 'package:maeumgagym_flutter/core/maeum/maeum_color.dart';
import 'package:maeumgagym_flutter/core/maeum/maeum_navigation.dart';
import 'package:maeumgagym_flutter/core/maeum/maeum_text.dart';
import 'package:maeumgagym_flutter/domain/pose/entity/pose_detail_entity.dart';
import 'package:maeumgagym_flutter/domain/routines/entity/routine_entity.dart';
import 'package:maeumgagym_flutter/domain/routines/entity/routines_entity.dart';
import 'package:maeumgagym_flutter/presentation/routine/ui/widget/add_to_routine/add_to_routine_detail_app_bar.dart';
import 'package:maeumgagym_flutter/presentation/routine/ui/widget/add_to_routine/add_to_routine_detail_bottom_sheet.dart';
import 'package:maeumgagym_flutter/presentation/routine/ui/widget/routine_add_edit_pose_item_count_widget.dart';
import 'package:maeumgagym_flutter/presentation/routine/view_model/routines/routines_bloc.dart';
import 'package:maeumgagym_flutter/presentation/routine/view_model/routines/routines_event.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../../../component/image_widget.dart';
import '../../view_model/routines/routines_state.dart';
import '../../view_model/today_routine/today_routine_bloc.dart';
import '../../view_model/today_routine/today_routine_event.dart';

class AddToRoutineDetailScreen extends StatefulWidget {
  final RoutineEntity routineData;
  final PoseDetailEntity poseData;

  const AddToRoutineDetailScreen({
    super.key,
    required this.routineData,
    required this.poseData,
  });

  @override
  State<AddToRoutineDetailScreen> createState() => _AddToRoutineDetailScreenState();
}

class _AddToRoutineDetailScreenState extends State<AddToRoutineDetailScreen> {
  late final TextEditingController _repetitionsController;

  late final TextEditingController _setsController;

  @override
  void initState() {
    super.initState();
    _repetitionsController = TextEditingController(text: "10")..addListener(() {
      if(_repetitionsController.text.isEmpty){
        _repetitionsController.text = "10";
      }
    });

    _setsController = TextEditingController(text: "1")..addListener(() {
      if(_setsController.text.isEmpty){
        _setsController.text = "1";
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _repetitionsController.dispose();;
    _setsController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<RoutinesBloc, RoutinesState<RoutinesEntity>>(
          listenWhen: (_, current) => current.routinesState == BlocStateEnum.loaded,
          listener: (_, state){
            showTopSnackBar(Overlay.of(context), MaeumToastMessage(title: "${widget.routineData.routineName}에 루틴을 추가했어요."));
            context.read<TodayRoutineBloc>().add(GetTodayRoutineEvent());

            MaeumNavigator.pop(context);
            MaeumNavigator.pop(context);
          },
        ),

        BlocListener<RoutinesBloc, RoutinesState<RoutinesEntity>>(
          listenWhen: (_, current) => current.routinesState == BlocStateEnum.error,
          listener: (_, state){
            showTopSnackBar(Overlay.of(context), MaeumToastMessage(title: "${widget.routineData.routineName}에 루틴을 추가하지 못했어요.", isError: true));
            context.read<RoutinesBloc>().add(GetRoutinesInitEvent());
            MaeumNavigator.pop(context);
            MaeumNavigator.pop(context);
          },
        )
      ],
      child: MyScaffold(
        appBar: AddToRoutineDetailAppBar(routineName: widget.routineData.routineName),
        bottomSheet: AddToRoutineDetailBottomSheet(
          routineData: widget.routineData,
          poseId: widget.poseData.id,
          repetitionsController: _repetitionsController,
          setsController: _setsController,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ImageWidget(
              imageType: ImageType.pngNetwork,
              image: widget.poseData.thumbnail,
              backgroundColor: MaeumColor.gray25,
              width: 1.sw,
              height: 300.h,
            ),

            SizedBox(height: 32.h),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MaeumText.titleMedium(
                    widget.poseData.simpleName,
                    MaeumColor.gray600,
                  ),
                  SizedBox(height: 8.h),
                  MaeumText.titleLarge(
                    widget.poseData.exactName,
                    MaeumColor.black,
                  ),

                  SizedBox(height: 24.h),

                  RoutineAddEditPoseItemCountWidget(
                    title: "횟수",
                    controller: _repetitionsController,
                  ),

                  SizedBox(height: 24.h),

                  RoutineAddEditPoseItemCountWidget(
                    title: "세트",
                    controller: _setsController,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}