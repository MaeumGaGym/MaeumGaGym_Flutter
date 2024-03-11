import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maeum_ga_gym_flutter/config/maeumgagym_color.dart';
import 'package:maeum_ga_gym_flutter/home/presentation/providers/home_timer_and_metronome_tab_bar_provider.dart';
import 'package:maeum_ga_gym_flutter/home/presentation/view/metronome/home_metronome_screen.dart';
import 'package:maeum_ga_gym_flutter/home/presentation/view/home_timer_screen.dart';
import 'package:maeum_ga_gym_flutter/home/presentation/widget/home_timer_and_metronome_tab_bar.dart';

class HomeTimerAndMetronomeScreen extends ConsumerWidget {
  const HomeTimerAndMetronomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pageController = ref.watch(homeTimerAndMetronomePageController);
    final timerAndMetronomeTabBarState = ref.watch(homeTimerAndMetronomeNotifierProvider);
    /// 현재 프레임이 그려진 후 해당 메서드 실행 / initState에 같이 써봤는데 오류나서 이렇게 합니다.
    if (timerAndMetronomeTabBarState == HomeTimerAndMetronomeTabBarState.metronome) {
      /// 탭바의 상태가 메트로놈 일 때에만 실행
      WidgetsBinding.instance.addPostFrameCallback((_) {
        pageController.jumpToPage(1);
      });
    }
    return Scaffold(
      body: SafeArea(
        child: PageView(
          controller: pageController,
          /// 드래그로 화면 전환 x
          physics: const NeverScrollableScrollPhysics(),
          children: const [
            HomeTimerScreen(),
            HomeMetronomeScreen()
          ],
        ),
      ),
      bottomNavigationBar: Container(
        color: MaeumgagymColor.white,
        child: const HomeTimerAndMetronomeTabBar(),
      ),
    );
  }
}
