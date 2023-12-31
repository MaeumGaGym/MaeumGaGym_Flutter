import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:maeum_ga_gym_flutter/config/maeumgagym_color.dart';
import 'package:maeum_ga_gym_flutter/core/component/text/pretendard/ptd_text_widget.dart';
import 'package:maeum_ga_gym_flutter/home/presentation/providers/timer_state_provider.dart';
import 'package:maeum_ga_gym_flutter/home/presentation/widget/main_container_title.dart';
import 'package:maeum_ga_gym_flutter/home/presentation/widget/main_metronome_widget.dart';
import 'package:maeum_ga_gym_flutter/home/presentation/widget/main_timer_widget.dart';

class MainTimeAndMetronomeContainer extends ConsumerStatefulWidget {
  const MainTimeAndMetronomeContainer({
    super.key,
  });

  @override
  ConsumerState<MainTimeAndMetronomeContainer> createState() =>
      _MainTimerAndMetronomeContainerState();
}

class _MainTimerAndMetronomeContainerState
    extends ConsumerState<MainTimeAndMetronomeContainer> {

  @override
  Widget build(BuildContext context) {
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
              child: MainContainerTitle(
                  title: ref.watch(timerStateProvider) ? "타이머" : "메트로놈"),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      ref.read(timerStateProvider.notifier).state = true;
                    },
                    child: Container(
                      width: 78,
                      height: 32,
                      decoration: BoxDecoration(
                          color: ref.watch(timerStateProvider)
                              ? MaeumgagymColor.blue500
                              : MaeumgagymColor.gray50,
                          borderRadius: BorderRadius.circular(16)),
                      child: Center(
                        child: ref.watch(timerStateProvider)
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
                  const SizedBox(width: 8),
                  GestureDetector(
                    onTap: () {
                      ref.read(timerStateProvider.notifier).state = false;
                    },
                    child: Container(
                      width: 92,
                      height: 32,
                      decoration: BoxDecoration(
                          color: !ref.watch(timerStateProvider)
                              ? MaeumgagymColor.blue500
                              : MaeumgagymColor.gray50,
                          borderRadius: BorderRadius.circular(16)),
                      child: Center(
                        child: !ref.watch(timerStateProvider)
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
                ],
              ),
            ),
            ref.watch(timerStateProvider) ? const MainTimerWidget() : const MainMetronomeWidget(),
          ],
        ),
      ),
    );
  }
}