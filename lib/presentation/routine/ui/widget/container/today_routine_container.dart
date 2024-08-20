import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maeumgagym_flutter/component/maeum_loding_indicator.dart';
import 'package:maeumgagym_flutter/core/enum/bloc_state_enum.dart';
import 'package:maeumgagym_flutter/core/maeum/maeum_color.dart';
import 'package:maeumgagym_flutter/core/maeum/maeum_navigation.dart';
import 'package:maeumgagym_flutter/domain/routines/entity/routines_entity.dart';
import 'package:maeumgagym_flutter/presentation/routine/ui/view/today_routine_screen.dart';
import 'package:maeumgagym_flutter/presentation/routine/ui/widget/container_widget/today_routine_container_empty_view.dart';
import 'package:maeumgagym_flutter/presentation/routine/ui/widget/container_widget/today_routine_container_page_dots.dart';
import 'package:maeumgagym_flutter/presentation/routine/ui/widget/container_widget/today_routine_container_routines_widget.dart';
import 'package:maeumgagym_flutter/presentation/routine/ui/widget/container_widget/today_routine_container_title_widget.dart';
import 'package:maeumgagym_flutter/presentation/routine/view_model/today_routine/today_routine_bloc.dart';
import 'package:maeumgagym_flutter/presentation/routine/view_model/today_routine/today_routine_page_state_cubit.dart';
import 'package:maeumgagym_flutter/presentation/routine/view_model/today_routine/today_routine_state.dart';

class TodayRoutineContainer extends StatefulWidget {
  const TodayRoutineContainer({super.key});

  @override
  State<TodayRoutineContainer> createState() => _TodayRoutineContainerState();
}

class _TodayRoutineContainerState extends State<TodayRoutineContainer> {
  late PageController _todayRoutinePageController;

  @override
  void initState() {
    super.initState();
    context.read<TodayRoutinePageStateCubit>().initState();
    _todayRoutinePageController = PageController(
      initialPage: 0,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _todayRoutinePageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // 오늘의 루틴 PageView의 page값을 가지고 있음
    final int todayRoutinePageState = context.watch<TodayRoutinePageStateCubit>().state;

    return BlocBuilder<TodayRoutineBloc, TodayRoutineState<RoutinesEntity>>(
      builder: (_, state) {
        if (state.todayRoutineState == BlocStateEnum.loading || state.todayRoutineState == BlocStateEnum.empty) {
          return const MaeumLoadingIndicator();
        } else if(state.todayRoutineState == BlocStateEnum.error) {
          return const TodayRoutineContainerEmptyView();
        } else {
          return Container(
            padding: EdgeInsets.fromLTRB(12.w, 24.h, 12.w, 16.h),
            decoration: BoxDecoration(
              color: MaeumColor.white,
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: Column(
              children: [
                /// 오늘의 루틴 Title Widget
                GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  // 오늘의 루틴이 없으면 RoutineScreen으로 들어가지 못함
                  onTap: () => MaeumNavigator.push(context, TodayRoutineScreen(todayRoutinePageState: todayRoutinePageState)),
                  child: TodayRoutineContainerTitleWidget(
                    routineName: state.value.routines[todayRoutinePageState].routineName,
                    isComplete: state.value.routines[todayRoutinePageState].isCompleted,
                  ),
                ),

                SizedBox(height: 24.h),

                /// 오늘의 루틴 Routines Widget
                TodayRoutineContainerRoutinesWidget(
                  routines: state.value,
                  todayRoutinePageController: _todayRoutinePageController,
                ),

                /// 오늘의 루틴 갯수에 따라 생기는 점들 ( Dots )
                TodayRoutineContainerPageDots(
                  routines: state.value,
                ),
              ],
            ),
          );
        }
      },
    );
  }
}
