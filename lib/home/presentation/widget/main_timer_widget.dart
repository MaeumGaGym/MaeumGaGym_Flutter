import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:maeum_ga_gym_flutter/config/maeumgagym_color.dart';
import 'package:maeum_ga_gym_flutter/core/component/text/pretendard/ptd_text_widget.dart';
import 'package:maeum_ga_gym_flutter/home/presentation/providers/timer_state_provider.dart';

class MainTimerWidget extends ConsumerStatefulWidget {
  const MainTimerWidget({Key? key}) : super(key: key);

  @override
  ConsumerState<MainTimerWidget> createState() => _MainTimerWidgetState();
}

class _MainTimerWidgetState extends ConsumerState<MainTimerWidget> {
  @override
  Widget build(BuildContext context) {
    final timerList = ref.watch(timersProvider);
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 18),
          child: ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: timerList.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset(
                              "assets/image/timer_icon.svg",
                              color: MaeumgagymColor.gray400,
                              width: 24,
                              height: 24,
                            ),
                            const SizedBox(width: 24),
                            PtdTextWidget.titleLarge(
                              Duration(seconds: timerList[index].currentTime.toInt()).toString().split(".").first.substring(2, 7),
                              timerList[index].timerState == TimerState.started ? MaeumgagymColor.blue500 : MaeumgagymColor.gray400,
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            if (timerList[index].timerState == TimerState.paused || timerList[index].timerState == TimerState.initial) {
                              ref.read(timersProvider.notifier).onStarted(timerList[index].timerId);
                            } else {
                              ref.read(timersProvider.notifier).onPaused(timerList[index].timerId);
                            }
                          },
                          child: Container(
                            width: 40,
                            height: 40,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: timerList[index].timerState ==
                                      TimerState.started
                                  ? MaeumgagymColor.gray50
                                  : MaeumgagymColor.blue500,
                              shape: BoxShape.circle,
                            ),
                            child: SvgPicture.asset(
                              timerList[index].timerState == TimerState.started
                                  ? 'assets/image/pause_icon.svg'
                                  : 'assets/image/play_filled_icon.svg',
                              color: MaeumgagymColor.white,
                              width: 20,
                              height: 20,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: index == timerList.length - 1 ? 0 : 18),
                ],
              );
            },
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          height: 48,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: MaeumgagymColor.gray50,
            borderRadius: BorderRadius.circular(50),
          ),
          child: SvgPicture.asset(
            'assets/image/add_icon.svg',
            color: MaeumgagymColor.gray800,
            height: 24,
            width: 24,
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
