import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:maeum_ga_gym_flutter/config/maeumgagym_color.dart';
import 'package:maeum_ga_gym_flutter/core/component/text/pretendard/ptd_text_widget.dart';
import 'package:maeum_ga_gym_flutter/home/presentation/providers/metronome_state_provider.dart';
import 'package:maeum_ga_gym_flutter/home/presentation/widget/metronome/widget/home_metronome_bpm_controller_widget.dart';

class HomeMetronomeBpmContainer extends ConsumerWidget {
  const HomeMetronomeBpmContainer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final metronomeState = ref.watch(metronomeController);
    final metronomeNotifier = ref.read(metronomeController.notifier);
    return SizedBox(
      height: 152,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          PtdTextWidget.bodyLarge(
            "BPM",
            MaeumgagymColor.blue400,
          ),
          SizedBox(
            height: 64,
            child: FittedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      metronomeNotifier.decreaseBpm();
                    },
                    child: const HomeMetronomeBpmControllerWidget(
                      iconPath: "assets/image/home_icon/remove_minus_icon.svg",
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: PtdTextWidget.onTimerAndMetronomeTitle(
                      metronomeState.bpm.toString(),
                      MaeumgagymColor.black,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      metronomeNotifier.increaseBpm();
                    },
                    child: const HomeMetronomeBpmControllerWidget(
                      iconPath: "assets/image/home_icon/add_icon.svg",
                    ),
                  ),
                ],
              ),
            ),
          ),
          Slider(
            activeColor: MaeumgagymColor.blue400,
            inactiveColor: MaeumgagymColor.gray100,
            thumbColor: MaeumgagymColor.blue400,
            value: metronomeState.bpm.toDouble(),
            min: 1,
            max: 300,
            onChanged: (value) {
              metronomeNotifier.changeBpm(value.toInt());
            },
            onChangeStart: (value) {
              metronomeNotifier.onPause();
            },
            onChangeEnd: (value) {
              metronomeNotifier.onPlay();
            },
          ),
        ],
      ),
    );
  }
}
