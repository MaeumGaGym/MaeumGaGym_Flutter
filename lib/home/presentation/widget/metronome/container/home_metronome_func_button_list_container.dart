import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maeum_ga_gym_flutter/config/maeumgagym_color.dart';
import 'package:maeum_ga_gym_flutter/home/presentation/providers/metronome_state_provider.dart';
import 'package:maeum_ga_gym_flutter/home/presentation/widget/timer/home_function_widget.dart';

class HomeMetronomeFuncListContainer extends ConsumerStatefulWidget {
  const HomeMetronomeFuncListContainer({super.key});

  @override
  ConsumerState<HomeMetronomeFuncListContainer> createState() =>
      _HomeMetronomeFuncListContainerState();
}

class _HomeMetronomeFuncListContainerState
    extends ConsumerState<HomeMetronomeFuncListContainer> {
  @override
  Widget build(BuildContext context) {
    final metronomeState = ref.watch(metronomeController);
    final metronomeNotifier = ref.read(metronomeController.notifier);
    return SizedBox(
      height: 177.5,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              /// 햅틱 설정 온오프
              metronomeNotifier.onVibration();
            },
            child: HomeFunctionWidget(
              size: 24,
              backgroundColor: metronomeState.onVibration
                  ? MaeumgagymColor.blue400
                  : MaeumgagymColor.white,
              padding: 22,
              iconColor: metronomeState.onVibration
                  ? MaeumgagymColor.white
                  : MaeumgagymColor.blue400,
              iconPath: "assets/image/home_icon/vibration_icon.svg",
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: GestureDetector(
              onTap: () async {
                /// 메트로놈 플레이 온오프
                if (metronomeState.onPlay) {
                  metronomeNotifier.onPause();
                } else {
                  metronomeNotifier.onPlay();
                }
              },
              child: HomeFunctionWidget(
                size: 40,
                backgroundColor: MaeumgagymColor.blue400,
                padding: 20,
                iconColor: MaeumgagymColor.white,
                iconPath: metronomeState.onPlay
                    ? "assets/image/home_icon/pause_icon.svg"
                    : "assets/image/home_icon/play_filled_icon.svg",
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              /// 볼륨 설정 온오프
              metronomeNotifier.onVolume();
            },
            child: HomeFunctionWidget(
              size: 24,
              backgroundColor: MaeumgagymColor.white,
              padding: 22,
              iconColor: MaeumgagymColor.blue400,
              iconPath: metronomeState.volume == 0
                  ? "assets/image/home_icon/volume_off_icon.svg"
                  : "assets/image/home_icon/volume_icon.svg",
            ),
          ),
        ],
      ),
    );
  }
}
