import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maeum_ga_gym_flutter/config/maeumgagym_color.dart';
import 'package:maeum_ga_gym_flutter/home/presentation/providers/timer_state_provider.dart';

class HomeTimerCircularTimerContainer extends ConsumerStatefulWidget {
  const HomeTimerCircularTimerContainer({super.key});

  @override
  ConsumerState<HomeTimerCircularTimerContainer> createState() =>
      _HomeTimerCircularTimerContainerState();
}

class _HomeTimerCircularTimerContainerState
    extends ConsumerState<HomeTimerCircularTimerContainer> {
  @override
  Widget build(BuildContext context) {
    final timerState = ref.watch(timersProvider);
    final timerIndex = ref.watch(selectedTimerProvider);
    return SizedBox(
      height: MediaQuery.of(context).size.width - 80,
      width: MediaQuery.of(context).size.width - 80,
      child: CircularProgressIndicator(
        color: Colors.red,
        value: timerState[timerIndex].currentTime.inMicroseconds /
            timerState[timerIndex].initialTime.inMicroseconds,
      ),
    );
  }
}
