import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maeumgagym_flutter/core/maeum/maeum_color.dart';
import 'package:maeumgagym_flutter/core/maeum/maeum_text.dart';
import 'package:maeumgagym_flutter/presentation/timer_metronome/view_model/timer/add_timer_duration_model.dart';
import 'package:maeumgagym_flutter/presentation/timer_metronome/view_model/timer/add_timer_duration_state_cubit.dart';

class AddTimerPickerWidget extends StatelessWidget {
  final TimerType timerType;

  const AddTimerPickerWidget({
    super.key,
    required this.timerType,
  });

  @override
  Widget build(BuildContext context) {
    AddTimerDurationStateCubit addTimerDurationNotifier =
        context.read<AddTimerDurationStateCubit>();

    return BlocBuilder<AddTimerDurationStateCubit, AddTimerDurationModel>(
      builder: (_, state) {
        return SizedBox(
          width: 85.w,
          height: 330.h,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 30.h),
                child: MaeumText.labelMedium(
                  addTimerDurationNotifier.formatTimerTitle(timerType),
                  MaeumColor.gray500,
                ),
              ),
              SizedBox(
                width: 77.w,
                height: 225.h,
                child: DefaultTextStyle(
                  style: TextStyle(
                    fontFamily: pretendard,
                    fontSize: 64.sp,
                    fontWeight: FontWeight.w300,
                    color: MaeumColor.gray100,
                    overflow: TextOverflow.visible,
                  ),
                  child: ListWheelScrollView.useDelegate(
                    itemExtent: 100,
                    physics: const FixedExtentScrollPhysics(),
                    squeeze: 1.2,
                    onSelectedItemChanged: (value) {
                      switch (timerType) {
                        case TimerType.hour:
                          addTimerDurationNotifier.changeHourState(value);
                          break;
                        case TimerType.minute:
                          addTimerDurationNotifier.changeMinuteState(value);
                          break;
                        case TimerType.second:
                          addTimerDurationNotifier.changeSecondState(value);
                          break;
                      }
                    },
                    childDelegate: ListWheelChildLoopingListDelegate(
                      children: List.generate(
                        addTimerDurationNotifier
                            .timerPickerListLength(timerType),
                        (index) {
                          switch (timerType) {
                            case TimerType.hour:
                              return MaeumText.timerPickerNumber(
                                index.toString().padLeft(2, '0'),
                                state.hours == index
                                    ? MaeumColor.black
                                    : MaeumColor.gray100,
                              );

                            case TimerType.minute:
                              return MaeumText.timerPickerNumber(
                                index.toString().padLeft(2, '0'),
                                state.minutes == index
                                    ? MaeumColor.black
                                    : MaeumColor.gray100,
                              );
                            case TimerType.second:
                              return MaeumText.timerPickerNumber(
                                index.toString().padLeft(2, '0'),
                                state.seconds == index
                                    ? MaeumColor.black
                                    : MaeumColor.gray100,
                              );
                          }
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
