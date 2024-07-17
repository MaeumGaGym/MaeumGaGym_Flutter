import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maeum_ga_gym_flutter/config/maeumgagym_color.dart';
import 'package:maeum_ga_gym_flutter/core/component/image/images.dart';
import 'package:maeum_ga_gym_flutter/core/component/image/image_widget.dart';
import 'package:maeum_ga_gym_flutter/core/component/text/pretendard/ptd_text_widget.dart';
import 'package:maeum_ga_gym_flutter/home/presentation/providers/home_timer_state_provider.dart';

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
    final timerState = ref.watch(homeTimersProvider);
    final timerIndex = ref.watch(selectedTimerProvider);
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.width - 80,
          width: MediaQuery.of(context).size.width - 80,
          child: CircularProgressIndicator(
            color: MaeumgagymColor.blue400,
            value: timerState[timerIndex].currentTime.inMicroseconds /
                timerState[timerIndex].initialTime.inMicroseconds,
            strokeWidth: 6,
            backgroundColor: MaeumgagymColor.gray100,
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.width - 249,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.max,
            children: [
              PtdTextWidget.bodyLarge(
                formatInitialTime(timerState[timerIndex].initialTime),
                MaeumgagymColor.black,
              ),
              SizedBox(
                height: 64,
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: PtdTextWidget.onTimerAndMetronomeTitle(
                    formatCurrentTime(timerState[timerIndex].currentTime),
                    MaeumgagymColor.black,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ImageWidget(
                      image: Images.iconsBell,
                      width: 20,
                      height: 20,
                      color: MaeumgagymColor.gray400,
                    ),
                    const SizedBox(width: 4),
                    PtdTextWidget.bodyMedium(
                      formatFinishTime(timerState[timerIndex].currentTime),
                      MaeumgagymColor.gray400,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
