import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maeumgagym_flutter/core/maeum/maeum_color.dart';
import 'package:maeumgagym_flutter/core/maeum/maeum_navigation.dart';
import 'package:maeumgagym_flutter/presentation/timer_metronome/ui/view/timer_metronome_screen.dart';
import 'package:maeumgagym_flutter/presentation/timer_metronome/ui/widget/container_widget/metronome/metronome_container.dart';
import 'package:maeumgagym_flutter/presentation/timer_metronome/ui/widget/container_widget/timer_metronome_change_button.dart';
import 'package:maeumgagym_flutter/presentation/timer_metronome/ui/widget/container_widget/timer_metronome_title.dart';

import '../../../view_model/timer_metronome_enum_state_cubit.dart';
import '../container_widget/timer/timer_container.dart';

class TimerMetronomeContainer extends StatelessWidget {
  const TimerMetronomeContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<IsTimerStateCubit, bool>(
      builder: (_, isTimer) {
        return Container(
          width: 1.sw - 40.w,
          padding: EdgeInsets.fromLTRB(12.w, 24.h, 12.w, 16.h),
          decoration: BoxDecoration(
            color: MaeumColor.white,
            borderRadius: BorderRadius.circular(16.r),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              /// Timer Title
              GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () => MaeumNavigator.push(context, const TimerMetronomeScreen()),
                child: TimerMetronomeTitle(isTimer: isTimer),
              ),

              SizedBox(height: 24.h),

              /// Timer랑 Metronome 선택하는 부분
              TimerMetronomeChangeButton(isTimer: isTimer),

              SizedBox(height: 18.h),

              /// Timer or Metronome Widget
              isTimer ? const TimerContainer() : const MetronomeContainer(),
            ],
          ),
        );
      },
    );
  }
}