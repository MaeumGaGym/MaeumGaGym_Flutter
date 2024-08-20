import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maeumgagym_flutter/core/maeum/maeum_color.dart';
import 'package:maeumgagym_flutter/core/maeum/maeum_text.dart';
import 'package:maeumgagym_flutter/presentation/timer_metronome/view_model/timer_metronome_enum_state_cubit.dart';

class TimerMetronomeChangeButton extends StatelessWidget {
  final bool isTimer;

  const TimerMetronomeChangeButton({super.key, required this.isTimer});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => context.read<IsTimerStateCubit>().changeTimer(),
            child: Container(
              decoration: BoxDecoration(
                color: isTimer ? MaeumColor.blue500 : MaeumColor.gray50,
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 18.w),
                child: Center(
                  child: isTimer
                      ? MaeumText.titleSmall("타이머", MaeumColor.white)
                      : MaeumText.bodyMedium("타이머", MaeumColor.black),
                ),
              ),
            ),
          ),
          SizedBox(width: 8.w),
          GestureDetector(
            onTap: () => context.read<IsTimerStateCubit>().changeMetronome(),
            child: Container(
              decoration: BoxDecoration(
                color: !isTimer ? MaeumColor.blue500 : MaeumColor.gray50,
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 18.w),
                child: Center(
                  child: !isTimer
                      ? MaeumText.titleSmall("메트로놈", MaeumColor.white)
                      : MaeumText.bodyMedium("메트로놈", MaeumColor.black),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
