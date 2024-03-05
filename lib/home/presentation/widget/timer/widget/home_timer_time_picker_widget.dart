import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maeum_ga_gym_flutter/home/presentation/providers/home_timer_add_duration_provider.dart';
import 'package:maeum_ga_gym_flutter/home/presentation/providers/local_timer_provider.dart';
import 'package:maeum_ga_gym_flutter/home/presentation/providers/timer_state_provider.dart';
import 'package:maeum_ga_gym_flutter/home/presentation/widget/timer/widget/home_timer_picker_bottom_button_widget.dart';

import '../../../../../config/maeumgagym_color.dart';
import '../../../../../core/component/text/pretendard/ptd_text_widget.dart';
import 'home_timer_cupertino_picker_widget.dart';

class HomeTimerTimePickerWidget extends ConsumerStatefulWidget {
  const HomeTimerTimePickerWidget({super.key});

  @override
  ConsumerState<HomeTimerTimePickerWidget> createState() =>
      _HomeTimerTimePickerWidgetState();
}

class _HomeTimerTimePickerWidgetState
    extends ConsumerState<HomeTimerTimePickerWidget> {
  @override
  Widget build(BuildContext context) {
    final homeTimerDurationState = ref.watch(homeTimerAddDurationProvider);
    final timersState = ref.watch(timersProvider);
    final timersNotifier = ref.watch(timersProvider.notifier);
    final localTimerState = ref.watch(localTimerController);
    final localTimerNotifier = ref.read(localTimerController.notifier);

    return Scaffold(
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
                  const HomeTimerCupertinoPickerWidget(
                    listLength: 24,
                    type: TimerType.hour,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: PtdTextWidget.timerPickerNumber(
                        ':', MaeumgagymColor.black),
                  ),
                  const HomeTimerCupertinoPickerWidget(
                    listLength: 60,
                    type: TimerType.minute,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: PtdTextWidget.timerPickerNumber(
                        ':', MaeumgagymColor.black),
                  ),
                  const HomeTimerCupertinoPickerWidget(
                    listLength: 60,
                    type: TimerType.seconds,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomSheet: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 74,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () {},
                child: const HomeTimerPickerBottomButtonWidget(title: '취소'),
              ),
              Container(width: 1, height: 24, color: MaeumgagymColor.gray100),
              GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () async {
                  await localTimerNotifier.addTimers(
                    timerId: timersState[timersState.length - 1].timerId + 1,
                    hours: homeTimerDurationState.hour,
                    minutes: homeTimerDurationState.minute,
                    seconds: homeTimerDurationState.seconds,
                  );

                  await localTimerNotifier.getTimers();

                  await timersNotifier.initAddTimer(localTimerState);

                  timersNotifier
                      .onReset(timersState[timersState.length - 1].timerId);

                  if (context.mounted) {
                    Navigator.pop(context);
                  }
                  // await ref.read(localTimerController.notifier).addTimers(
                  //       timerId:
                  //           timersState[timersState.length - 1].timerId + 1,
                  //       hours: homeTimerDurationState.hour,
                  //       minutes: homeTimerDurationState.minute,
                  //       seconds: homeTimerDurationState.seconds,
                  //     );
                  //
                  // await timersNotifier.addTimer(
                  //   Duration(
                  //     hours: homeTimerDurationState.hour,
                  //     minutes: homeTimerDurationState.minute,
                  //     seconds: homeTimerDurationState.seconds,
                  //   ),
                  // );
                  // timersNotifier
                  //     .onReset(timersState[timersState.length - 1].timerId);
                  //
                  // if (context.mounted) {
                  //   Navigator.pop(context);
                  // }
                },
                child: const HomeTimerPickerBottomButtonWidget(title: '확인'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
