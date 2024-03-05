import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:maeum_ga_gym_flutter/config/maeumgagym_color.dart';
import 'package:maeum_ga_gym_flutter/home/presentation/providers/timer_state_provider.dart';

import '../../../providers/local_timer_provider.dart';

class HomeTimerFuncButtonListContainer extends ConsumerWidget {
  const HomeTimerFuncButtonListContainer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final timerIndex = ref.watch(selectedTimerProvider);
    final timerIndexNotifier = ref.watch(selectedTimerProvider.notifier);
    final timerState = ref.watch(timersProvider);
    final timerNotifier = ref.read(timersProvider.notifier);
    final localTimerState = ref.watch(localTimerController);
    final localTimerNotifier = ref.read(localTimerController.notifier);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // delete
        GestureDetector(
          onTap: () async {
            if (timerState.length > 1) {
              timerIndex == 0
                  ? timerIndexNotifier.state = timerIndex
                  : timerIndexNotifier.state = timerIndex - 1;

              await localTimerNotifier.delTimers(timerIndex);

              await localTimerNotifier.getTimers();

              await timerNotifier.initAddTimer(localTimerState);

              timerNotifier.onReset(timerState[timerState.length - 1].timerId);
            }
          },
          child: Container(
            decoration: BoxDecoration(
              color: MaeumgagymColor.white,
              shape: BoxShape.circle,
              border: Border.all(color: MaeumgagymColor.blue400, width: 1),
            ),
            child: Padding(
              padding: const EdgeInsets.all(22),
              child: SvgPicture.asset(
                "assets/image/self_care_icon/close_icon.svg",
                width: 24,
                height: 24,
                color: MaeumgagymColor.blue400,
              ),
            ),
          ),
        ),
        // start parse
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: GestureDetector(
            onTap: () {
              // if (timerState[timerIndex].timerState != TimerState.started) {
              //   timerNotifier.onStarted(timerIndex + 1);
              // } else {
              //   timerNotifier.onPaused(timerIndex + 1);
              // }
              if (timerState[timerIndex].timerState != TimerState.started) {
                timerNotifier.onStarted(timerState[timerIndex].timerId);
              } else {
                timerNotifier.onPaused(timerState[timerIndex].timerId);
              }
            },
            child: Container(
              decoration: BoxDecoration(
                color: MaeumgagymColor.blue400,
                shape: BoxShape.circle,
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: SvgPicture.asset(
                  timerState[timerIndex].timerState == TimerState.started
                      ? "assets/image/home_icon/pause_icon.svg"
                      : "assets/image/home_icon/play_filled_icon.svg",
                  width: 40,
                  height: 40,
                  color: MaeumgagymColor.white,
                ),
              ),
            ),
          ),
        ),
        // reset
        GestureDetector(
          onTap: () {
            timerNotifier.onReset(timerState[timerIndex].timerId);
          },
          child: Container(
            decoration: BoxDecoration(
              color: MaeumgagymColor.white,
              shape: BoxShape.circle,
              border: Border.all(color: MaeumgagymColor.blue400, width: 1),
            ),
            child: Padding(
              padding: const EdgeInsets.all(22),
              child: SvgPicture.asset(
                "assets/image/home_icon/edit_redo_icon.svg",
                width: 24,
                height: 24,
                color: MaeumgagymColor.blue400,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
