import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:maeum_ga_gym_flutter/config/maeumgagym_color.dart';
import 'package:maeum_ga_gym_flutter/core/component/image/images.dart';
import 'package:maeum_ga_gym_flutter/core/component/image/image_widget.dart';
import 'package:maeum_ga_gym_flutter/core/component/text/pretendard/ptd_text_widget.dart';
import 'package:maeum_ga_gym_flutter/home/presentation/providers/home_timer_state_provider.dart';
import 'package:maeum_ga_gym_flutter/home/presentation/view/home_timer_screen.dart';

class HomeMainTimerWidget extends ConsumerStatefulWidget {
  const HomeMainTimerWidget({Key? key}) : super(key: key);

  @override
  ConsumerState<HomeMainTimerWidget> createState() => _MainTimerWidgetState();
}

class _MainTimerWidgetState extends ConsumerState<HomeMainTimerWidget> {
  @override
  Widget build(BuildContext context) {
    final timerList = ref.watch(homeTimersProvider);
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
                    child: GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const HomeTimerScreen(),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              ImageWidget(
                                image: Images.timeTimer,
                                width: 24,
                                height: 24,
                                color: MaeumgagymColor.gray400,
                              ),
                              const SizedBox(width: 24),
                              PtdTextWidget.titleLarge(
                                formatDuration(timerList[index].currentTime)
                                    .toString(),
                                timerList[index].timerState ==
                                        TimerState.started
                                    ? MaeumgagymColor.blue500
                                    : MaeumgagymColor.gray400,
                              ),
                            ],
                          ),
                          GestureDetector(
                            onTap: () {
                              if (timerList[index].timerState ==
                                      TimerState.paused ||
                                  timerList[index].timerState ==
                                      TimerState.initial) {
                                ref.read(homeTimersProvider.notifier).onStarted(
                                    timerList[index].timerId, Overlay.of(context));
                              } else {
                                ref
                                    .read(homeTimersProvider.notifier)
                                    .onPaused(timerList[index].timerId);
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
                              child: ImageWidget(
                                image: timerList[index].timerState ==
                                        TimerState.started
                                    ? Images.mediaPause
                                    : Images.mediaPlayFilled,
                                width: 20,
                                height: 20,
                                color: timerList[index].timerState ==
                                        TimerState.started
                                    ? MaeumgagymColor.black
                                    : MaeumgagymColor.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: index == timerList.length - 1 ? 0 : 18),
                ],
              );
            },
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const HomeTimerScreen(),
              ),
            );
          },
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 48,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: MaeumgagymColor.gray50,
              borderRadius: BorderRadius.circular(50),
            ),
            child: ImageWidget(
              image: Images.editAdd,
              width: 24,
              height: 24,
              color: MaeumgagymColor.gray800,
            ),
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  String formatDuration(Duration duration) {
    String twoDigits(int n) {
      return n < 10 ? "0$n" : "$n";
    }

    int hours = duration.inHours;
    int minutes = duration.inMinutes.remainder(60);
    int seconds = duration.inSeconds.remainder(60);

    String formattedDuration = "";

    if (hours != 0) {
      formattedDuration += "$hours:";
    }

    if (minutes != 0) {
      formattedDuration += hours != 0 ? "${twoDigits(minutes)}:" : "$minutes:";
    } else if (hours != 0) {
      formattedDuration += "00:";
    }

    formattedDuration +=
        hours == 0 && minutes == 0 ? "$seconds" : twoDigits(seconds);

    return formattedDuration;
  }
}
