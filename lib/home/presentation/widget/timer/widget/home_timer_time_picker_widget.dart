import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maeum_ga_gym_flutter/core/component/maeumgagym_toast_message.dart';
import 'package:maeum_ga_gym_flutter/home/presentation/providers/home_timer_add_duration_provider.dart';
import 'package:maeum_ga_gym_flutter/home/presentation/providers/local_timer_provider.dart';
import 'package:maeum_ga_gym_flutter/home/presentation/providers/home_timer_state_provider.dart';
import 'package:maeum_ga_gym_flutter/home/presentation/widget/timer/widget/home_timer_picker_bottom_button_widget.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../../../../config/maeumgagym_color.dart';
import '../../../../../core/component/text/pretendard/ptd_text_widget.dart';
import 'home_timer_picker_widget.dart';

class HomeTimerTimePickerWidget extends ConsumerStatefulWidget {
  const HomeTimerTimePickerWidget({super.key});

  @override
  ConsumerState<HomeTimerTimePickerWidget> createState() =>
      _HomeTimerTimePickerWidgetState();
}

class _HomeTimerTimePickerWidgetState
    extends ConsumerState<HomeTimerTimePickerWidget> {
  void _showToast({required String message}) {
    showTopSnackBar(
      Overlay.of(context),
      MaeumGaGymToastMessage(title: message),
    );
  }

  @override
  Widget build(BuildContext context) {
    final homeTimerDurationState = ref.watch(homeTimerAddDurationProvider);
    final timersNotifier = ref.watch(homeTimersProvider.notifier);
    final localTimerNotifier = ref.read(localTimerController.notifier);

    return Container(
      decoration: BoxDecoration(
        color: MaeumgagymColor.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // AppBar
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 24),
                child: PtdTextWidget.titleMedium(
                  '타이머 추가',
                  MaeumgagymColor.black,
                ),
              ),

              // Body
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const HomeTimerPickerWidget(
                      listLength: 24,
                      type: TimerType.hour,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: PtdTextWidget.timerPickerNumber(
                          ':', MaeumgagymColor.black),
                    ),
                    const HomeTimerPickerWidget(
                      listLength: 60,
                      type: TimerType.minute,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: PtdTextWidget.timerPickerNumber(
                          ':', MaeumgagymColor.black),
                    ),
                    const HomeTimerPickerWidget(
                      listLength: 60,
                      type: TimerType.seconds,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomSheet: Container(
          width: MediaQuery.of(context).size.width,
          height: 74,
          color: MaeumgagymColor.white,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () => Navigator.pop(context),
                  child: const HomeTimerPickerBottomButtonWidget(title: '취소'),
                ),
                Container(width: 1, height: 24, color: MaeumgagymColor.gray100),
                GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () async {
                    if (!(homeTimerDurationState.hour == 0 &&
                        homeTimerDurationState.minute == 0 &&
                        homeTimerDurationState.seconds == 0)) {
                      int timerId = ref
                          .watch(homeTimersProvider)[
                              ref.watch(homeTimersProvider).length - 1]
                          .timerId;

                      await timersNotifier.addTimer(
                        timerId: timerId + 1,
                        hours: homeTimerDurationState.hour,
                        minutes: homeTimerDurationState.minute,
                        seconds: homeTimerDurationState.seconds,
                      );

                      await localTimerNotifier.addTimers(
                        timerId: timerId + 1,
                        hours: homeTimerDurationState.hour,
                        minutes: homeTimerDurationState.minute,
                        seconds: homeTimerDurationState.seconds,
                      );

                      timersNotifier.onReset(timerId + 1);
                    } else {
                      _showToast(message: "0초인 타이머는 만들 수 없어요.");
                    }
                    if (context.mounted) {
                      Navigator.pop(context);
                    }
                  },
                  child: const HomeTimerPickerBottomButtonWidget(title: '확인'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
