import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maeum_ga_gym_flutter/config/maeumgagym_color.dart';
import 'package:maeum_ga_gym_flutter/core/component/text/pretendard/ptd_text_widget.dart';
import 'package:maeum_ga_gym_flutter/home/presentation/providers/timer_state_provider.dart';

class HomeTimerListContainer extends ConsumerWidget {
  const HomeTimerListContainer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final timerState = ref.watch(timersProvider);
    final timerIndexState = ref.watch(selectedTimerProvider);
    final timerIndexNotifier = ref.read(selectedTimerProvider.notifier);
    return SizedBox(
      height: 100,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: timerState.length,
        itemBuilder: (context, index) {
          return Row(
            children: [
              SizedBox(width: index == 0 ? 40 : 0),
              GestureDetector(
                onTap: () {
                  timerIndexNotifier.state = index;
                  // ref.watch(homeTimerPageController).jumpToPage(index);
                  debugPrint(timerIndexNotifier.state.toString());
                },
                child: Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    color: index == timerIndexState
                        ? MaeumgagymColor.white
                        : timerState[index].timerState == TimerState.started
                            ? MaeumgagymColor.blue50
                            : MaeumgagymColor.gray50,
                    border: index == timerIndexState
                        ? Border.all(
                            color: MaeumgagymColor.blue400,
                            width: 2,
                          )
                        : null,
                    shape: BoxShape.circle,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      PtdTextWidget.timerListTitle(
                        formatTimerListTime(timerState[index].initialTime),
                        MaeumgagymColor.black,
                      ),
                      if (timerState[index].timerState == TimerState.started)
                        Column(
                          children: [
                            const SizedBox(height: 2),
                            PtdTextWidget.bodyTiny(
                              formatTimerListTime(
                                  timerState[index].currentTime),
                              MaeumgagymColor.blue500,
                            ),
                          ],
                        ),
                    ],
                  ),
                ),
              ),
              SizedBox(width: index == timerState.length ? 40 : 20),
            ],
          );
        },
      ),
    );
  }
}
