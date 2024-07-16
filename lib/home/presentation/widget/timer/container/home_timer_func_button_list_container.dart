import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maeum_ga_gym_flutter/config/maeumgagym_color.dart';
import 'package:maeum_ga_gym_flutter/core/component/image/images.dart';
import 'package:maeum_ga_gym_flutter/home/presentation/providers/home_timer_state_provider.dart';
import 'package:maeum_ga_gym_flutter/home/presentation/widget/timer/home_function_widget.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../../../../core/component/maeumgagym_toast_message.dart';
import '../../../providers/local_timer_provider.dart';

class HomeTimerFuncButtonListContainer extends ConsumerWidget {
  const HomeTimerFuncButtonListContainer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final timerIndexNotifier = ref.watch(selectedTimerProvider.notifier);
    final timerNotifier = ref.read(homeTimersProvider.notifier);
    final localTimerNotifier = ref.read(localTimerController.notifier);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // delete
        GestureDetector(
          onTap: () {
            var timerState = ref.watch(homeTimersProvider);
            int timerIndex = ref.watch(selectedTimerProvider);

            if (timerState.length > 1) {
              timerNotifier.delTimer(timerIndex: timerIndex);

              localTimerNotifier.delTimers(timerIndex);

              timerIndex == 0
                  ? timerIndexNotifier.state = timerIndex
                  : timerIndexNotifier.state = timerIndex - 1;

              if (timerState[timerIndex].timerState != TimerState.started) {
                timerNotifier.onStarted(
                    timerState[timerIndex].timerId, Overlay.of(context));
                timerNotifier.onPaused(timerState[timerIndex].timerId);
              } else {
                timerNotifier.onPaused(timerState[timerIndex].timerId);
                timerNotifier.onStarted(
                    timerState[timerIndex].timerId, Overlay.of(context));
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
            iconPath: Images.editClose,
            // iconPath: "assets/image/self_care_icon/close_icon.svg",
          ),
        ),
        // start parse
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: GestureDetector(
            onTap: () {
              var timerState = ref.watch(homeTimersProvider);
              int timerIndex = ref.watch(selectedTimerProvider);

              if (timerState[timerIndex].timerState != TimerState.started) {
                timerNotifier.onStarted(
                    timerState[timerIndex].timerId, Overlay.of(context));
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
                          .watch(homeTimersProvider)[
                              ref.watch(selectedTimerProvider)]
                          .timerState ==
                      TimerState.started
                  ? Images.mediaPause
                  : Images.mediaPlayFilled,
            ),
          ),
        ),
        // reset
        GestureDetector(
          onTap: () {
            timerNotifier.onReset(
              ref
                  .watch(homeTimersProvider)[ref.watch(selectedTimerProvider)]
                  .timerId,
            );
          },
          child: HomeFunctionWidget(
            size: 24,
            backgroundColor: MaeumgagymColor.white,
            padding: 22,
            iconColor: MaeumgagymColor.blue400,
            iconPath: Images.editRedo,
          ),
        ),
      ],
    );
  }
}
