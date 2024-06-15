import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maeum_ga_gym_flutter/config/maeumgagym_color.dart';
import 'package:maeum_ga_gym_flutter/home/presentation/providers/timer_state_provider.dart';
import 'package:maeum_ga_gym_flutter/home/presentation/widget/timer/home_function_widget.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../../../../core/component/maeumgagym_toast_message.dart';
import '../../../providers/local_timer_provider.dart';

class HomeTimerFuncButtonListContainer extends ConsumerWidget {
  const HomeTimerFuncButtonListContainer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final timerIndexNotifier = ref.watch(selectedTimerProvider.notifier);
    final timerNotifier = ref.read(timersProvider.notifier);
    final localTimerNotifier = ref.read(localTimerController.notifier);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // delete
        GestureDetector(
          onTap: () async {
            var timerState = ref.watch(timersProvider);
            int timerIndex = ref.watch(selectedTimerProvider);

            if (timerState.length > 1) {
              await timerNotifier.delTimer(timerIndex: timerIndex);

              await localTimerNotifier.delTimers(timerIndex);

              timerIndex == 0
                  ? timerIndexNotifier.state = timerIndex
                  : timerIndexNotifier.state = timerIndex - 1;

              if (timerState[timerIndex].timerState != TimerState.started) {
                timerNotifier.onStarted(timerState[timerIndex].timerId);
                timerNotifier.onPaused(timerState[timerIndex].timerId);
              } else {
                timerNotifier.onPaused(timerState[timerIndex].timerId);
                timerNotifier.onStarted(timerState[timerIndex].timerId);
              }
            } else {
              showTopSnackBar(
                Overlay.of(context),
                const MaeumGaGymToastMessage(title: "타이머 최소 개수는 1개 입니다."),
              );
            }
          },
          child: HomeFunctionWidget(
            size: 24,
            backgroundColor: MaeumgagymColor.white,
            padding: 22,
            iconColor: MaeumgagymColor.blue400,
            iconPath: "assets/image/self_care_icon/close_icon.svg",
          ),
        ),
        // start parse
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: GestureDetector(
            onTap: () {
              var timerState = ref.watch(timersProvider);
              int timerIndex = ref.watch(selectedTimerProvider);

              if (timerState[timerIndex].timerState != TimerState.started) {
                timerNotifier.onStarted(timerState[timerIndex].timerId);
              } else {
                timerNotifier.onPaused(timerState[timerIndex].timerId);
              }
            },
            child: HomeFunctionWidget(
              size: 40,
              backgroundColor: MaeumgagymColor.blue400,
              padding: 20,
              iconColor: MaeumgagymColor.white,
              iconPath: ref
                          .watch(
                              timersProvider)[ref.watch(selectedTimerProvider)]
                          .timerState ==
                      TimerState.started
                  ? "assets/image/home_icon/pause_icon.svg"
                  : "assets/image/home_icon/play_filled_icon.svg",
            ),
          ),
        ),
        // reset
        GestureDetector(
          onTap: () {
            timerNotifier.onReset(
              ref
                  .watch(timersProvider)[ref.watch(selectedTimerProvider)]
                  .timerId,
            );
          },
          child: HomeFunctionWidget(
            size: 24,
            backgroundColor: MaeumgagymColor.white,
            padding: 22,
            iconColor: MaeumgagymColor.blue400,
            iconPath: "assets/image/home_icon/edit_redo_icon.svg",
          ),
        ),
      ],
    );
  }
}
