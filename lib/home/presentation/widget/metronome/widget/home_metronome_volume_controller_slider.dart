import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maeum_ga_gym_flutter/config/maeumgagym_color.dart';
import 'package:maeum_ga_gym_flutter/core/component/text/pretendard/ptd_text_widget.dart';
import 'package:maeum_ga_gym_flutter/home/presentation/providers/metronome_state_provider.dart';

class HomeMetronomeVolumeControllerSlider extends ConsumerWidget {
  const HomeMetronomeVolumeControllerSlider({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final metronomeState = ref.watch(metronomeController);
    final metronomeNotifier = ref.read(metronomeController.notifier);
    return Container(
      height: 140,
      width: 19,
      decoration: BoxDecoration(
        color: MaeumgagymColor.white,
        borderRadius: BorderRadius.circular(100),
        boxShadow: [
          BoxShadow(
            color: MaeumgagymColor.black.withOpacity(0.3),
            blurRadius: 6,
          ),
        ],
      ),
      child: RotatedBox(
        /// 회전
        quarterTurns: -1,
        child: SliderTheme(
          data: SliderThemeData(
            activeTrackColor: MaeumgagymColor.blue400,
            inactiveTrackColor: MaeumgagymColor.gray100,
            thumbColor: MaeumgagymColor.blue400,
            valueIndicatorColor: MaeumgagymColor.black.withOpacity(0.3),
            showValueIndicator: ShowValueIndicator.always,
            valueIndicatorTextStyle: TextStyle(
              fontFamily: pretendard,
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: MaeumgagymColor.white,
              overflow: TextOverflow.visible,
            ),
          ),
          child: Slider(
            value: metronomeState.volume.toDouble(),
            label: metronomeState.volume.toString(),
            min: 0,
            max: 10,
            onChanged: (value) {
              metronomeNotifier.setVolume(value.toInt());
            },
          ),
        ),
      ),
    );
  }
}
