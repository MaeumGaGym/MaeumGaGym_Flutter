import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maeumgagym_flutter/core/maeum/maeum_color.dart';
import 'package:maeumgagym_flutter/domain/timer/entity/timer_entity.dart';
import 'package:maeumgagym_flutter/domain/timer/entity/timers_entity.dart';
import 'package:maeumgagym_flutter/presentation/timer_metronome/ui/widget/timer_metronome_button_widget.dart';
import 'package:maeumgagym_flutter/presentation/timer_metronome/view_model/timer/timer_index_state_cubit.dart';
import 'package:maeumgagym_flutter/presentation/timer_metronome/view_model/timer/timer_state.dart';
import 'package:maeumgagym_flutter/presentation/timer_metronome/view_model/timer/timer_state_cubit.dart';

import '../../../../../core/enum/timer_state_enum.dart';
import '../../../../../core/images.dart';

class TimerButtonsWidget extends StatelessWidget {
  final int timerIndex;

  const TimerButtonsWidget({
    super.key,
    required this.timerIndex,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TimerStateCubit, TimerState<TimersEntity>>(
      builder: (_, state) {
        final TimersEntity timersData = state.value;
        final TimerEntity timerData = timersData.timers[timerIndex];

        final isStart = timerData.timerState == TimerStateEnum.started;

        return Container(
          alignment: Alignment.topCenter,
          padding: EdgeInsets.only(bottom: 40.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // del
              GestureDetector(
                onTap: () {
                  if(timerIndex == (timersData.timers.length - 1)){
                    context.read<TimerIndexStateCubit>().changeState(timerIndex - 1);
                    context.read<TimerStateCubit>().delTimer(timerIndex: timerIndex);
                  } else {
                    context.read<TimerStateCubit>().delTimer(timerIndex: timerIndex);
                  }
                },
                child: TimerMetronomeButtonWidget(
                  width: 24.w,
                  backgroundColor: MaeumColor.white,
                  padding: 22.w,
                  iconColor: MaeumColor.blue400,
                  iconPath: Images.editClose,
                  // iconPath: "assets/image/self_care_icon/close_icon.svg",
                ),
              ),
              // start parse
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: GestureDetector(
                  onTap: () {
                    if(isStart) {
                      context.read<TimerStateCubit>().pauseTimer(timerId: timerData.timerId);
                    } else {
                      context.read<TimerStateCubit>().startTimer(timerId: timerData.timerId);
                    }
                  },
                  child: TimerMetronomeButtonWidget(
                    width: 40.w,
                    backgroundColor: MaeumColor.blue400,
                    padding: 20.w,
                    iconColor: MaeumColor.white,
                    iconPath: isStart ? Images.mediaPause : Images.mediaPlayFilled,
                  ),
                ),
              ),
              // reset
              GestureDetector(
                onTap: () => context.read<TimerStateCubit>().resetTimer(timerId: timerData.timerId),
                child: TimerMetronomeButtonWidget(
                  width: 24.w,
                  backgroundColor: MaeumColor.white,
                  padding: 22.w,
                  iconColor: MaeumColor.blue400,
                  iconPath: Images.editRedo,
                ),
              ),
            ],
          ),
        );
      }
    );
  }
}
