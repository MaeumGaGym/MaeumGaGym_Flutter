import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maeumgagym_flutter/core/enum/timer_state_enum.dart';
import 'package:maeumgagym_flutter/domain/timer/entity/timer_entity.dart';

import '../../../../../component/image_widget.dart';
import '../../../../../core/images.dart';
import '../../../../../core/maeum/maeum_color.dart';
import '../../../../../core/maeum/maeum_text.dart';
import '../../../../../domain/timer/entity/timers_entity.dart';
import '../../../view_model/timer/timer_format_func.dart';
import '../../../view_model/timer/timer_state.dart';
import '../../../view_model/timer/timer_state_cubit.dart';

class TimerCircularIndicatorWidget extends StatelessWidget {
  final int timerIndex;

  const TimerCircularIndicatorWidget({
    super.key,
    required this.timerIndex,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TimerStateCubit, TimerState<TimersEntity>>(
      builder: (_, state) {
        final TimersEntity timersData = state.value;
        final TimerEntity timerData = timersData.timers[timerIndex];

        final bool isStart = timerData.timerState == TimerStateEnum.started;

        final String formatInitialTime = TimerFormatFunc.formatInitialTime(initialTime: timerData.initialTime);
        final String formatCurrentTime = TimerFormatFunc.formatCurrentTime(currentTime: timerData.currentTime);
        final String formatFinishTime = TimerFormatFunc.formatFinishTime(currentTime: timerData.currentTime);

        return SizedBox(
          width: 1.sw,
          height: 350.h,
          child: Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                width: 350.w,
                height: 350.w,
                child: CircularProgressIndicator(
                  color: isStart ? MaeumColor.blue400 : MaeumColor.gray400,
                  value: timersData.timers[timerIndex].currentTime.inMicroseconds /
                      timersData.timers[timerIndex].initialTime.inMicroseconds,
                  strokeWidth: 6.w,
                  backgroundColor: MaeumColor.gray100,
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  MaeumText.bodyLarge(formatInitialTime, MaeumColor.black),
                  SizedBox(height: 32.h),
                  MaeumText.timerPickerNumber(formatCurrentTime, MaeumColor.black),
                  SizedBox(height: 32.h),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ImageWidget(
                        image: Images.iconsBell,
                        width: 20.w,
                        height: 20.h,
                        color: MaeumColor.gray400,
                      ),
                      SizedBox(width: 4.w),
                      MaeumText.bodyMedium(
                        formatFinishTime,
                        MaeumColor.gray400,
                      )
                    ],
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
