import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:maeum_ga_gym_flutter/config/maeumgagym_color.dart';
import 'package:maeum_ga_gym_flutter/core/component/text/pretendard/ptd_text_widget.dart';
import 'package:maeum_ga_gym_flutter/home/presentation/providers/home_timer_and_metronome_tab_bar_provider.dart';
import 'package:maeum_ga_gym_flutter/home/presentation/providers/timer_state_provider.dart';
import 'package:maeum_ga_gym_flutter/home/presentation/view/home_metronome_screen.dart';
import 'package:maeum_ga_gym_flutter/home/presentation/view/home_timer_and_metronome_screen.dart';
import 'package:maeum_ga_gym_flutter/home/presentation/view/home_timer_screen.dart';
import 'package:maeum_ga_gym_flutter/home/presentation/widget/main/widget/home_main_container_title.dart';
import 'package:maeum_ga_gym_flutter/home/presentation/widget/main/widget/home_main_metronome_widget.dart';
import 'package:maeum_ga_gym_flutter/home/presentation/widget/main/widget/home_main_timer_widget.dart';
import 'package:maeum_ga_gym_flutter/page_manager/presentation/provider/page_manager_controller.dart';

class HomeMainTimeAndMetronomeContainer extends ConsumerStatefulWidget {
  const HomeMainTimeAndMetronomeContainer({
    super.key,
  });

  @override
  ConsumerState<HomeMainTimeAndMetronomeContainer> createState() =>
      _MainTimerAndMetronomeContainerState();
}

class _MainTimerAndMetronomeContainerState
    extends ConsumerState<HomeMainTimeAndMetronomeContainer> {
  @override
  Widget build(BuildContext context) {
    final timerAndMetronomeTabBarState =
        ref.watch(homeTimerAndMetronomeNotifierProvider);
    final timerAndMetronomeTarBarNotifier =
        ref.read(homeTimerAndMetronomeNotifierProvider.notifier);
    return Container(
      decoration: BoxDecoration(
        color: MaeumgagymColor.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 24),
              child: GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const HomeTimerAndMetronomeScreen(),

                      /// 메트로놈 페이지,
                    ),
                  );
                },
                child: HomeMainContainerTitle(
                  title: timerAndMetronomeTabBarState ==
                          HomeTimerAndMetronomeTabBarState.timer
                      ? "타이머"
                      : "메트로놈",
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      timerAndMetronomeTarBarNotifier.changeTimer();
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: timerAndMetronomeTabBarState ==
                                HomeTimerAndMetronomeTabBarState.timer
                            ? MaeumgagymColor.blue500
                            : MaeumgagymColor.gray50,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 4,
                          horizontal: 18,
                        ),
                        child: Center(
                          child: timerAndMetronomeTabBarState ==
                                  HomeTimerAndMetronomeTabBarState.timer
                              ? PtdTextWidget.titleSmall(
                                  "타이머",
                                  MaeumgagymColor.white,
                                )
                              : PtdTextWidget.bodyMedium(
                                  "타이머",
                                  MaeumgagymColor.black,
                                ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  GestureDetector(
                    onTap: () {
                      timerAndMetronomeTarBarNotifier.changeMetronome();
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: timerAndMetronomeTabBarState ==
                                HomeTimerAndMetronomeTabBarState.metronome
                            ? MaeumgagymColor.blue500
                            : MaeumgagymColor.gray50,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 4,
                          horizontal: 18,
                        ),
                        child: Center(
                          child: timerAndMetronomeTabBarState ==
                                  HomeTimerAndMetronomeTabBarState.metronome
                              ? PtdTextWidget.titleSmall(
                                  "메트로놈",
                                  MaeumgagymColor.white,
                                )
                              : PtdTextWidget.bodyMedium(
                                  "메트로놈",
                                  MaeumgagymColor.black,
                                ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            timerAndMetronomeTabBarState ==
                    HomeTimerAndMetronomeTabBarState.timer
                ? const HomeMainTimerWidget()
                : const HomeMainMetronomeWidget(),
          ],
        ),
      ),
    );
  }
}
