import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:maeum_ga_gym_flutter/config/maeumgagym_color.dart';
import 'package:maeum_ga_gym_flutter/core/component/text/pretendard/ptd_text_widget.dart';
import 'package:maeum_ga_gym_flutter/home/presentation/providers/metronome_state_provider.dart';

class HomeMainMetronomeWidget extends ConsumerStatefulWidget {
  const HomeMainMetronomeWidget({Key? key}) : super(key: key);

  @override
  ConsumerState<HomeMainMetronomeWidget> createState() =>
      _MainMetronomeWidgetState();
}

class _MainMetronomeWidgetState extends ConsumerState<HomeMainMetronomeWidget> with WidgetsBindingObserver {
  @override
  Widget build(BuildContext context) {
    final metronomeState = ref.watch(metronomeController);
    final metronomeNotifier = ref.read(metronomeController.notifier);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 18),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: FittedBox(
                  child: SizedBox(
                    width: 248,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SvgPicture.asset(
                          "assets/image/home_icon/metronome_icon.svg",
                          width: 24,
                          height: 24,
                          color: MaeumgagymColor.gray400,
                        ),
                        SizedBox(
                          height: 48,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              FittedBox(
                                fit: BoxFit.fitWidth,
                                child: PtdTextWidget.titleLarge(
                                  metronomeState.bpm.toString(),
                                  metronomeState.onPlay
                                      ? MaeumgagymColor.blue500
                                      : MaeumgagymColor.gray400,
                                ),
                              ),
                              const SizedBox(width: 8),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 6),
                                child: SizedBox(
                                  width: 34,
                                  child: FittedBox(
                                    fit: BoxFit.fitWidth,
                                    child: PtdTextWidget.titleSmall(
                                      "BPM",
                                      metronomeState.onPlay
                                          ? MaeumgagymColor.blue500
                                          : MaeumgagymColor.gray400,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                metronomeNotifier.decreaseBpm();
                              },
                              child: Container(
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: MaeumgagymColor.gray50,
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SvgPicture.asset(
                                    "assets/image/home_icon/remove_minus_icon.svg",
                                    width: 16,
                                    height: 16,
                                    color: MaeumgagymColor.black,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),
                            GestureDetector(
                              onTap: () {
                                metronomeNotifier.increaseBpm();
                              },
                              child: Container(
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: MaeumgagymColor.gray50,
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SvgPicture.asset(
                                    "assets/image/home_icon/add_icon.svg",
                                    width: 16,
                                    height: 16,
                                    color: MaeumgagymColor.black,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 46),
              GestureDetector(
                onTap: () async {
                  if (metronomeState.onPlay) {
                    metronomeNotifier.onPause();
                  } else {
                    metronomeNotifier.onPlay();
                  }
                },
                child: Container(
                  width: 40,
                  height: 40,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: metronomeState.onPlay
                        ? MaeumgagymColor.gray50
                        : MaeumgagymColor.blue500,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: SvgPicture.asset(
                    metronomeState.onPlay
                        ? "assets/image/home_icon/pause_icon.svg"
                        : "assets/image/home_icon/play_filled_icon.svg",
                    width: 20,
                    height: 20,
                    color: metronomeState.onPlay
                        ? MaeumgagymColor.black
                        : MaeumgagymColor.white,
                  ),
                ),
              )
            ],
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
