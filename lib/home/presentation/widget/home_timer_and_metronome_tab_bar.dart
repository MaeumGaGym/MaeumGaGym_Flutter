import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maeum_ga_gym_flutter/config/maeumgagym_color.dart';
import 'package:maeum_ga_gym_flutter/core/component/text/pretendard/ptd_text_widget.dart';
import 'package:maeum_ga_gym_flutter/home/presentation/providers/home_timer_and_metronome_tab_bar_provider.dart';

class HomeTimerAndMetronomeTabBar extends ConsumerWidget {
  const HomeTimerAndMetronomeTabBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    /// TabBar 상태 관리 provider
    final timerAndMetronomeTabBarState = ref.watch(homeTimerAndMetronomeNotifierProvider);
    final timerAndMetronomeTarBarNotifier = ref.read(homeTimerAndMetronomeNotifierProvider.notifier);
    /// pageController 상태 관리 provider
    final pageController = ref.read(homeTimerAndMetronomePageController.notifier);
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: SizedBox(
          height: 48,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  /// TabBar 상태 변경
                  timerAndMetronomeTarBarNotifier.changeTimer();
                  /// 0번째 index 화면으로 화면 전환
                  pageController.state.jumpToPage(0);
                },
                child: Container(
                  height: 40,
                  width: 92,
                  decoration: BoxDecoration(
                    color: timerAndMetronomeTabBarState == HomeTimerAndMetronomeTabBarState.timer
                        ? MaeumgagymColor.gray50
                        : MaeumgagymColor.white,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Center(
                    child: PtdTextWidget.labelLarge(
                      "타이머",
                      timerAndMetronomeTabBarState == HomeTimerAndMetronomeTabBarState.timer
                          ? MaeumgagymColor.black
                          : MaeumgagymColor.gray400,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 30),
              GestureDetector(
                onTap: () {
                  timerAndMetronomeTarBarNotifier.changeMetronome();
                  pageController.state.jumpToPage(1);
                },
                child: Container(
                  width: 110,
                  height: 40,
                  decoration: BoxDecoration(
                    color: timerAndMetronomeTabBarState == HomeTimerAndMetronomeTabBarState.metronome
                        ? MaeumgagymColor.gray50
                        : MaeumgagymColor.white,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Center(
                    child: PtdTextWidget.labelLarge(
                      "메트로놈",
                      timerAndMetronomeTabBarState == HomeTimerAndMetronomeTabBarState.metronome ? MaeumgagymColor.black : MaeumgagymColor.gray400,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
