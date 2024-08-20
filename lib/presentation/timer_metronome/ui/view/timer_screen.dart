import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maeumgagym_flutter/component/maeum_loding_indicator.dart';
import 'package:maeumgagym_flutter/component/my_scaffold.dart';
import 'package:maeumgagym_flutter/core/enum/bloc_state_enum.dart';
import 'package:maeumgagym_flutter/presentation/timer_metronome/ui/widget/timer/timer_app_bar.dart';
import 'package:maeumgagym_flutter/presentation/timer_metronome/ui/widget/timer/timer_buttons_widget.dart';
import 'package:maeumgagym_flutter/presentation/timer_metronome/ui/widget/timer/timer_circular_indicator_widget.dart';
import 'package:maeumgagym_flutter/presentation/timer_metronome/ui/widget/timer/timer_emtpy_view.dart';
import 'package:maeumgagym_flutter/presentation/timer_metronome/ui/widget/timer/timer_list_widget.dart';
import 'package:maeumgagym_flutter/presentation/timer_metronome/view_model/timer/timer_index_state_cubit.dart';
import 'package:maeumgagym_flutter/presentation/timer_metronome/view_model/timer/timer_state.dart';
import 'package:maeumgagym_flutter/presentation/timer_metronome/view_model/timer/timer_state_cubit.dart';

import '../../../../domain/timer/entity/timers_entity.dart';

class TimerScreen extends StatelessWidget {
  const TimerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      appBar: const TimerAppBar(),
      body: BlocBuilder<TimerIndexStateCubit, int>(
        builder: (_, state) {
          final int timerIndex = state;

          return BlocBuilder<TimerStateCubit, TimerState<TimersEntity>>(
            builder: (_, state) {
              if(state.timerState == BlocStateEnum.loading || state.timerState == BlocStateEnum.empty){
                return const MaeumLoadingIndicator();
              } else {
                if (state.value.timers.isEmpty) {
                  /// Timer가 없을 때
                  return const TimerEmptyView();
                } else {
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 40.h),
                    child: Column(
                      children: [
                        TimerCircularIndicatorWidget(timerIndex: timerIndex),
                        TimerListWidget(timerIndex: timerIndex),
                        TimerButtonsWidget(timerIndex: timerIndex),
                      ],
                    ),
                  );
                }
              }
            },
          );
        },
      ),
    );
  }
}
