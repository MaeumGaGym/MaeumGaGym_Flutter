import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maeumgagym_flutter/core/enum/timer_state_enum.dart';
import 'package:maeumgagym_flutter/core/maeum/maeum_color.dart';
import 'package:maeumgagym_flutter/core/maeum/maeum_text.dart';
import 'package:maeumgagym_flutter/domain/timer/entity/timer_entity.dart';
import 'package:maeumgagym_flutter/domain/timer/entity/timers_entity.dart';
import 'package:maeumgagym_flutter/presentation/timer_metronome/view_model/timer/timer_format_func.dart';
import 'package:maeumgagym_flutter/presentation/timer_metronome/view_model/timer/timer_index_state_cubit.dart';
import 'package:maeumgagym_flutter/presentation/timer_metronome/view_model/timer/timer_state.dart';
import 'package:maeumgagym_flutter/presentation/timer_metronome/view_model/timer/timer_state_cubit.dart';

class TimerListWidget extends StatelessWidget {
  final int timerIndex;

  const TimerListWidget({
    super.key,
    required this.timerIndex,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TimerStateCubit, TimerState<TimersEntity>>(
      builder: (_, state) {
        final timersData = state.value;

        return Padding(
          padding: EdgeInsets.symmetric(vertical: 59.5.h),
          child: SizedBox(
            height: 100.h,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: timersData.timers.length,
              itemBuilder: (_, index) {
                final TimerEntity timerData = timersData.timers[index];

                final String formatInitialTime = TimerFormatFunc.formatCurrentTime(currentTime: timerData.initialTime);
                final String formatCurrentTime = TimerFormatFunc.formatCurrentTime(currentTime: timerData.currentTime);

                return Padding(
                  padding: EdgeInsets.only(
                  left: index == 0 ? 40.w : 20.w,
                  right: index == timersData.timers.length - 1 ? 40.w : 0,
                ),
                child: GestureDetector(
                    onTap: () => context.read<TimerIndexStateCubit>().changeState(index),
                    child: Container(
                      width: 100.w,
                      height: 100.h,
                      decoration: BoxDecoration(
                        color: index == timerIndex
                            ? MaeumColor.white
                            : timerData.timerState == TimerStateEnum.started
                            ? MaeumColor.blue50
                            : MaeumColor.gray50,
                        border: index == timerIndex
                            ? Border.all(
                          color: MaeumColor.blue400,
                          width: 2.w,
                        )
                            : null,
                        shape: BoxShape.circle,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          MaeumText.timerListTitle(formatInitialTime, MaeumColor.black),
                          Builder(
                            builder: (_) {
                              if(timerData.timerState == TimerStateEnum.started){
                                return Column(
                                  children: [
                                    SizedBox(height: 2.h),
                                    MaeumText.bodyTiny(formatCurrentTime, MaeumColor.blue500),
                                  ],
                                );
                              } else {
                                return const SizedBox.shrink();
                              }
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        );
      }
    );
  }
}
