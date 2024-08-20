import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maeumgagym_flutter/domain/pose/entity/pose_detail_entity.dart';
import 'package:maeumgagym_flutter/presentation/routine/ui/widget/add_to_routine/add_to_routine_app_bar.dart';

import '../../../../component/maeum_loding_indicator.dart';
import '../../../../component/my_scaffold.dart';
import '../../../../core/enum/bloc_state_enum.dart';
import '../../../../core/maeum/maeum_color.dart';
import '../../../../core/maeum/maeum_text.dart';
import '../../../../domain/routines/entity/routine_entity.dart';
import '../../../../domain/routines/entity/routines_entity.dart';
import '../../view_model/routines/routines_bloc.dart';
import '../../view_model/routines/routines_event.dart';
import '../../view_model/routines/routines_state.dart';
import '../widget/add_to_routine/add_to_routine_item_widget.dart';
import '../widget/routine/routine_emtpry_widget.dart';

class AddToRoutineScreen extends StatefulWidget {
  final PoseDetailEntity poseData;

  const AddToRoutineScreen({super.key, required this.poseData});

  @override
  State<AddToRoutineScreen> createState() => _AddToRoutineScreenState();
}

class _AddToRoutineScreenState extends State<AddToRoutineScreen> {
  late final ScrollController _routineScrollController;

  @override
  void initState() {
    super.initState();
    context.read<RoutinesBloc>().add(GetRoutinesInitEvent());

    _routineScrollController = ScrollController();
    _routineScrollController.addListener(() => listener());
  }

  @override
  void dispose() {
    super.dispose();
    _routineScrollController.dispose();
  }

  void listener() {
    /// 화면 스크롤 컨트롤러의 위치가 최대 스크롤 위치이면서 API가 로딩 중이 아닐 때 (API가 실행 중이 아닐 때)
    if (_routineScrollController.position.pixels ==
        _routineScrollController.position.maxScrollExtent) {
      if (context.read<RoutinesBloc>().state.value.routines.length % 10 == 0) {
        context.read<RoutinesBloc>().add(GetRoutinesEvent(
            index: context.read<RoutinesBloc>().state.value.routines.length ~/
                10));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      appBar: const AddToRoutineAppBar(),
      body: SingleChildScrollView(
        controller: _routineScrollController,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MaeumText.titleLarge(
                    "루틴에 추가",
                    MaeumColor.black,
                  ),
                  SizedBox(height: 12.h),
                  MaeumText.bodyMedium(
                    "${widget.poseData.exactName}을 추가하고 싶은\n루틴을 선택하세요",
                    MaeumColor.gray600,
                  ),
                ],
              ),

              SizedBox(height: 32.h),

              // const AddToRoutineItemListWidget(),
              BlocBuilder<RoutinesBloc, RoutinesState<RoutinesEntity>>(
                builder: (_, state) {
                  if (state.routinesState == BlocStateEnum.loading ||
                      state.routinesState == BlocStateEnum.empty) {
                    return const MaeumLoadingIndicator();
                  } else if (state.value.routines.isEmpty) {
                    return const RoutineEmptyWidget();
                  } else {
                    final RoutinesEntity routinesData = state.value;

                    return ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: routinesData.routines.length,
                      itemBuilder: (_, index) {
                        final RoutineEntity routineData =
                            routinesData.routines[index];

                        /// Routine Item
                        return AddToRoutineItemWidget(
                          routineData: routineData,
                          poseData: widget.poseData,
                        );
                      },
                    );
                  }
                },
              ),

              SizedBox(height: 98.h),
            ],
          ),
        ),
      ),
    );
  }
}
