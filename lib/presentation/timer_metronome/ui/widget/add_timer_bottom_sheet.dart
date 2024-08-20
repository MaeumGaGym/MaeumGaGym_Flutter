import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maeumgagym_flutter/component/maeum_toast_message.dart';
import 'package:maeumgagym_flutter/core/maeum/maeum_color.dart';
import 'package:maeumgagym_flutter/core/maeum/maeum_navigation.dart';
import 'package:maeumgagym_flutter/presentation/timer_metronome/view_model/timer/add_timer_duration_model.dart';
import 'package:maeumgagym_flutter/presentation/timer_metronome/view_model/timer/timer_state_cubit.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../../../core/maeum/maeum_text.dart';
import '../../view_model/timer/add_timer_duration_state_cubit.dart';
import 'add_timer_picker_widget.dart';

class AddTimerBottomSheet extends StatefulWidget {
  const AddTimerBottomSheet({super.key});

  @override
  State<AddTimerBottomSheet> createState() => _AddTimerBottomSheetState();
}

class _AddTimerBottomSheetState extends State<AddTimerBottomSheet> {
  @override
  void initState() {
    super.initState();
    context.read<AddTimerDurationStateCubit>().init();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 494.h,
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      decoration: BoxDecoration(
        color: MaeumColor.white,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // AppBar
          Padding(
            padding: EdgeInsets.symmetric(vertical: 24.h),
            child: MaeumText.titleMedium(
              '타이머 추가',
              MaeumColor.black,
            ),
          ),

          // Body
          Container(
            width: 1.sw - 40.w,
            height: 340.h,
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const AddTimerPickerWidget(
                  timerType: TimerType.hour,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: MaeumText.timerPickerNumber(':', MaeumColor.black),
                ),
                const AddTimerPickerWidget(
                  timerType: TimerType.minute,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: MaeumText.timerPickerNumber(':', MaeumColor.black),
                ),
                const AddTimerPickerWidget(
                  timerType: TimerType.second,
                ),
              ],
            ),
          ),
          const Spacer(),
          Padding(
            padding: EdgeInsets.only(bottom: 20.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () => MaeumNavigator.pop(context),
                  child: Container(
                    width: (1.sw / 2) - 30.w,
                    alignment: Alignment.center,
                    child: MaeumText.labelLarge(
                      "취소",
                      MaeumColor.black,
                    ),
                  ),
                ),

                Container(width: 1.w, height: 24.h, color: MaeumColor.gray100),

                GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () {
                    AddTimerDurationModel state = context.read<
                        AddTimerDurationStateCubit>().state;

                    if(state.hours == 0 && state.minutes == 0 && state.seconds == 0){
                      showTopSnackBar(
                        Overlay.of(context),
                        const MaeumToastMessage(title: "0초인 타이머는 설정할 수 없어요", isError: true,),
                      );
                    } else {
                      context.read<TimerStateCubit>().addTimer(
                        hours: state.hours,
                        minutes: state.minutes,
                        seconds: state.seconds,
                      );

                      MaeumNavigator.pop(context);
                    }
                  },
                  child: Container(
                    width: (1.sw / 2) - 30.w,
                    alignment: Alignment.center,
                    child: MaeumText.labelLarge(
                      "확인",
                      MaeumColor.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}