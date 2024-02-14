import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maeum_ga_gym_flutter/config/maeumgagym_color.dart';
import 'package:maeum_ga_gym_flutter/home/presentation/providers/timer_state_provider.dart';
import 'package:maeum_ga_gym_flutter/home/presentation/widget/timer/widget/home_timer_widget.dart';

class HomeTimerCircularTimerContainer extends ConsumerStatefulWidget {
  const HomeTimerCircularTimerContainer({super.key});

  @override
  ConsumerState<HomeTimerCircularTimerContainer> createState() =>
      _HomeTimerCircularTimerContainerState();
}

class _HomeTimerCircularTimerContainerState extends ConsumerState<HomeTimerCircularTimerContainer> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final timerState = ref.watch(timersProvider);
    final timerIndex = ref.watch(selectedTimerProvider);
    final timerController = ref.watch(homeTimerProvider);
    return HomeTimerWidget(
      controller: timerController,
      duration: timerState[timerIndex].currentTime.inSeconds,
      width: MediaQuery.of(context).size.width - 80,
      height: MediaQuery.of(context).size.width - 80,
      fillColor: MaeumgagymColor.blue400,
      autoStart: false,
      isReverse: true,
      isReverseAnimation: true,
      ringColor: MaeumgagymColor.gray100,
      strokeWidth: 6,
      strokeCap: StrokeCap.round,
      onStart: () {
        timerController.start();
      },
    );
  }
}
