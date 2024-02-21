import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:maeum_ga_gym_flutter/config/maeumgagym_color.dart';
import 'package:maeum_ga_gym_flutter/core/component/text/pretendard/ptd_text_widget.dart';
import 'package:maeum_ga_gym_flutter/home/presentation/providers/metronome_state_provider.dart';

class HomeMetronomeBpmContainer extends ConsumerWidget {
  const HomeMetronomeBpmContainer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final metronomeBpmState = ref.watch(metronomeBpmProvider);
    final metronomeBpmNotifier = ref.read(metronomeBpmProvider.notifier);
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
                      metronomeBpmNotifier.state--;
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: MaeumgagymColor.gray50,
                        shape: BoxShape.circle,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: SvgPicture.asset(
                          "assets/image/home_icon/remove_minus_icon.svg",
                          color: MaeumgagymColor.gray300,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: PtdTextWidget.onTimerAndMetronomeTitle(
                      metronomeBpmState.toString(),
                      MaeumgagymColor.black,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      metronomeBpmNotifier.state++;
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: MaeumgagymColor.gray50,
                        shape: BoxShape.circle,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: SvgPicture.asset(
                          "assets/image/home_icon/add_icon.svg",
                          color: MaeumgagymColor.gray300,
                        ),
                      ),
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
            value: metronomeBpmState.toDouble(),
            min: 1,
            max: 300,
            onChanged: (value) {
              metronomeBpmNotifier.state = value.toInt();
            },
          ),
        ],
      ),
    );
  }
}
