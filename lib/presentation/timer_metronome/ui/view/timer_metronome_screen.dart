import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maeumgagym_flutter/core/maeum/maeum_color.dart';
import 'package:maeumgagym_flutter/core/maeum/maeum_text.dart';
import 'package:maeumgagym_flutter/presentation/timer_metronome/ui/view/metronome_screen.dart';
import 'package:maeumgagym_flutter/presentation/timer_metronome/ui/view/timer_screen.dart';

import '../../view_model/timer_metronome_enum_state_cubit.dart';

class TimerMetronomeScreen extends StatefulWidget {
  const TimerMetronomeScreen({super.key});

  @override
  State<TimerMetronomeScreen> createState() => _TimerMetronomeScreenState();
}

class _TimerMetronomeScreenState extends State<TimerMetronomeScreen> {
  @override
  Widget build(BuildContext context) {
    bool isTimer = context.watch<IsTimerStateCubit>().state;

    return Scaffold(
      body: IndexedStack(
        index: isTimer ? 0 : 1,
        children: const [
          TimerScreen(),
          MetronomeScreen(),
        ],
      ),

      /// Timer Metronome을 선택할 수 있는 버튼
      bottomSheet: Padding(
        padding: EdgeInsets.symmetric(vertical: 4.h),
        child: SizedBox(
          height: 48.h,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () => setState(() => context.read<IsTimerStateCubit>().changeTimer()),
                child: Container(
                  height: 40.h,
                  width: 92.w,
                  decoration: BoxDecoration(
                    color: isTimer ? MaeumColor.gray50 : MaeumColor.white,
                    borderRadius: BorderRadius.circular(100.r),
                  ),
                  child: Center(
                    child: MaeumText.labelLarge(
                      "타이머",
                      isTimer ? MaeumColor.black : MaeumColor.gray400,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 30.w),
              GestureDetector(
                onTap: () => setState(() => context.read<IsTimerStateCubit>().changeMetronome()),
                child: Container(
                  width: 110.w,
                  height: 40.h,
                  decoration: BoxDecoration(
                    color: !isTimer ? MaeumColor.gray50 : MaeumColor.white,
                    borderRadius: BorderRadius.circular(100.r),
                  ),
                  child: Center(
                    child: MaeumText.labelLarge(
                      "메트로놈",
                      !isTimer ? MaeumColor.black : MaeumColor.gray400,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}