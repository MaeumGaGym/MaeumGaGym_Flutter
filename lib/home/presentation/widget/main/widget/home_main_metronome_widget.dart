import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:maeum_ga_gym_flutter/config/maeumgagym_color.dart';
import 'package:maeum_ga_gym_flutter/core/component/image/images.dart';
import 'package:maeum_ga_gym_flutter/core/component/image/image_widget.dart';
import 'package:maeum_ga_gym_flutter/core/component/text/pretendard/ptd_text_widget.dart';
import 'package:maeum_ga_gym_flutter/home/presentation/providers/metronome_state_provider.dart';
import 'package:maeum_ga_gym_flutter/home/presentation/view/metronome/home_metronome_screen.dart';

class HomeMainMetronomeWidget extends ConsumerStatefulWidget {
  const HomeMainMetronomeWidget({Key? key}) : super(key: key);

  @override
  ConsumerState<HomeMainMetronomeWidget> createState() =>
      _MainMetronomeWidgetState();
}

class _MainMetronomeWidgetState extends ConsumerState<HomeMainMetronomeWidget>
    with WidgetsBindingObserver {
  @override
  Widget build(BuildContext context) {
    final metronomeState = ref.watch(metronomeController);
    final metronomeNotifier = ref.read(metronomeController.notifier);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 18),
        GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () => Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const HomeMetronomeScreen(),
            ),
          ),
          child: Padding(
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
                          ImageWidget(
                            image: Images.timeMetronome,
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
                                  child: const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: ImageWidget(
                                      image: Images.editRemoveMinus,
                                      width: 16,
                                      height: 16,
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
                                  child: const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: ImageWidget(
                                      image: Images.editAdd,
                                      width: 16,
                                      height: 16,
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
                    child: ImageWidget(
                      image: metronomeState.onPlay
                          ? Images.mediaPause
                          : Images.mediaPlayFilled,
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
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
