import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maeumgagym_flutter/component/maeum_loding_indicator.dart';
import 'package:maeumgagym_flutter/component/my_scaffold.dart';
import 'package:maeumgagym_flutter/core/enum/bloc_state_enum.dart';
import 'package:maeumgagym_flutter/domain/routines/entity/routines_entity.dart';
import 'package:maeumgagym_flutter/presentation/routine/ui/widget/today_routine/today_routine_button.dart';
import 'package:maeumgagym_flutter/presentation/routine/ui/widget/today_routine/today_routine_list_widget.dart';
import 'package:maeumgagym_flutter/presentation/routine/ui/widget/today_routine/today_routine_title.dart';
import 'package:maeumgagym_flutter/presentation/routine/view_model/today_routine/today_routine_bloc.dart';
import 'package:maeumgagym_flutter/presentation/routine/view_model/today_routine/today_routine_state.dart';
import '../../../../domain/routines/entity/routine_entity.dart';
import '../widget/today_routine/today_routine_app_bar.dart';

class TodayRoutineScreen extends StatelessWidget {
  final int todayRoutinePageState;

  const TodayRoutineScreen({
    super.key,
    required this.todayRoutinePageState,
  });

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      /// 오늘의 루틴 AppBar
      appBar: const TodayRoutineAppBar(),

      /// 오늘의 루틴 Button
      bottomSheet: const TodayRoutineButton(),

      /// 오늘의 루틴 Body
      body: BlocBuilder<TodayRoutineBloc, TodayRoutineState<RoutinesEntity>>(
        builder: (_, state) {
          if(state.todayRoutineState == BlocStateEnum.loading){
            return const MaeumLoadingIndicator();
          } else {
            // 각각의 routine data
            RoutineEntity routineData = state.value.routines[todayRoutinePageState];

            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Routine Title
                  TodayRoutineTitle(routineData: routineData),

                  SizedBox(height: 32.h),

                  /// Routine List
                  Expanded(
                    child: ListView.builder(
                      itemCount: routineData.routinePoseList.length,
                      itemBuilder: (_, index) {
                        final poseData = routineData.routinePoseList[index];
                        return TodayRoutineListWidget(
                          routinePoseData: poseData,
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 75.h)
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
