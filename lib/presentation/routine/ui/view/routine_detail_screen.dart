import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maeumgagym_flutter/component/maeum_loding_indicator.dart';
import 'package:maeumgagym_flutter/component/my_scaffold.dart';
import 'package:maeumgagym_flutter/core/enum/bloc_state_enum.dart';
import 'package:maeumgagym_flutter/domain/routines/entity/routine_entity.dart';
import 'package:maeumgagym_flutter/presentation/routine/ui/widget/routine_detail/routine_detail_pose_list_widget.dart';
import 'package:maeumgagym_flutter/presentation/routine/ui/widget/routine_detail/routine_detail_title_widget.dart';
import 'package:maeumgagym_flutter/presentation/routine/view_model/routine/routine_bloc.dart';
import 'package:maeumgagym_flutter/presentation/routine/view_model/routine/routine_event.dart';
import 'package:maeumgagym_flutter/presentation/routine/view_model/routine/routine_state.dart';
import '../widget/routine_detail/routine_detail_app_bar.dart';
import '../widget/routine_detail/routine_detail_bottom_sheet.dart';

class RoutineDetailScreen extends StatefulWidget {
  final int routineId;

  const RoutineDetailScreen({super.key, required this.routineId});

  @override
  State<RoutineDetailScreen> createState() => _RoutineDetailScreenState();
}

class _RoutineDetailScreenState extends State<RoutineDetailScreen> {
  @override
  void initState() {
    super.initState();

    context
        .read<RoutineBloc>()
        .add(GetRoutineDetailEvent(routineId: widget.routineId));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RoutineBloc, RoutineState<RoutineEntity>>(
      builder: (_, state) {
        /// Loading
        if (state.routineState == BlocStateEnum.loading ||
            state.routineState == BlocStateEnum.empty) {
          return const MyScaffold(
            appBar: RoutineDetailAppBar(),
            body: MaeumLoadingIndicator(),
          );
        }
        /// Loading End
        else {
          RoutineEntity routineData = state.value;
          // RoutineEntity routineData = context.read<RoutinesBloc>().getRoutineDetail(routineIndex: routineIndex)!;

          return MyScaffold(
            appBar: const RoutineDetailAppBar(),
            /// 밑에 버튼들
            bottomSheet: RoutineDetailBottomSheet(routineData: routineData),
            body: Padding(
              padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 20.w),
              child: Column(
                children: [
                  /// Routine Detail Title
                  RoutineDetailTitleWidget(
                    routineName: routineData.routineName,
                    isShared: routineData.routineStatus.isShared,
                    isArchived: routineData.routineStatus.isArchived,
                    dayOfWeeks: routineData.dayOfWeeks,
                  ),

                  SizedBox(height: 32.h),

                  /// Routine Detail List
                  RoutineDetailPoseListWidget(routineData: routineData)
                ],
              ),
            ),
          );
        }
      },
    );
  }
}