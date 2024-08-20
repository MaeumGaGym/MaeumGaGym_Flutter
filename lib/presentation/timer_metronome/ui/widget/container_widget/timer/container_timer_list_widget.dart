import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maeumgagym_flutter/component/image_widget.dart';
import 'package:maeumgagym_flutter/core/enum/timer_state_enum.dart';
import 'package:maeumgagym_flutter/core/images.dart';
import 'package:maeumgagym_flutter/core/maeum/maeum_color.dart';
import 'package:maeumgagym_flutter/core/maeum/maeum_text.dart';
import 'package:maeumgagym_flutter/domain/timer/entity/timers_entity.dart';
import 'package:maeumgagym_flutter/presentation/timer_metronome/view_model/timer/timer_format_func.dart';
import 'package:maeumgagym_flutter/presentation/timer_metronome/view_model/timer/timer_state.dart';
import 'package:maeumgagym_flutter/presentation/timer_metronome/view_model/timer/timer_state_cubit.dart';

class ContainerTimerListWidget extends StatelessWidget {
  const ContainerTimerListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TimerStateCubit, TimerState<TimersEntity>>(
      builder: (_, state) {
        return ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: state.value.timers.length,
          itemBuilder: (_, index) {
            final timerData = state.value.timers[index];
            final isStart = timerData.timerState == TimerStateEnum.started;

            final String formatCurrentTime = TimerFormatFunc.formatContainerCurrentTime(currentTime: timerData.currentTime);

            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [

                          /// Timer Image
                          ImageWidget(
                            image: Images.timeTimer,
                            width: 24.w,
                            color: MaeumColor.gray400,
                          ),

                          SizedBox(width: 24.w),

                          /// Timer CurrentText ( Timer 글씨 )
                          MaeumText.titleLarge(
                            formatCurrentTime,
                            isStart ? MaeumColor.blue500 : MaeumColor.gray400,
                          ),
                        ],
                      ),

                      /// Start / Pause Button
                      GestureDetector(
                        onTap: () {
                          if(isStart) {
                            context.read<TimerStateCubit>().pauseTimer(timerId: timerData.timerId);
                          } else {
                            context.read<TimerStateCubit>().startTimer(timerId: timerData.timerId);
                          }
                        },
                        child: Container(
                          padding: EdgeInsets.all(10.w),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: isStart ? MaeumColor.gray50 : MaeumColor.blue500,
                            shape: BoxShape.circle,
                          ),
                          child: ImageWidget(
                            image: isStart ? Images.mediaPause : Images.mediaPlayFilled,
                            width: 20.w,
                            color: isStart ? MaeumColor.black : MaeumColor.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 18.h),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
