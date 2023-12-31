import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:maeum_ga_gym_flutter/config/maeumgagym_color.dart';
import 'package:maeum_ga_gym_flutter/core/component/text/pretendard/ptd_text_widget.dart';
import 'package:maeum_ga_gym_flutter/home/presentation/providers/metronome_state_provider.dart';

class MainMetronomeWidget extends ConsumerStatefulWidget {
  const MainMetronomeWidget({Key? key}) : super(key: key);

  @override
  ConsumerState<MainMetronomeWidget> createState() => _MainMetronomeWidgetState();
}

class _MainMetronomeWidgetState extends ConsumerState<MainMetronomeWidget> {
  @override
  Widget build(BuildContext context) {
    final metronomeState = ref.watch(metronomeStateProvider);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 18),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SvgPicture.asset(
                    "assets/image/metronome_icon.svg",
                    width: 24,
                    height: 24,
                    color: MaeumgagymColor.gray400,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Row(
                      children: [
                        PtdTextWidget.titleLarge(
                          ref.watch(metronomeValueProvider).toString(),
                          metronomeState ? MaeumgagymColor.blue500 : MaeumgagymColor.gray400,
                        ),
                        const SizedBox(width: 8),
                        PtdTextWidget.titleSmall(
                          "BPM",
                          metronomeState ? MaeumgagymColor.blue500 : MaeumgagymColor.gray400,
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      ref.read(metronomeValueProvider.notifier).minus();
                    },
                    child: Container(
                      width: 32,
                      height: 32,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: MaeumgagymColor.gray50,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: SvgPicture.asset(
                        "assets/image/remove_minus_icon.svg",
                        width: 16,
                        height: 16,
                        color: MaeumgagymColor.black,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  GestureDetector(
                    onTap: () {
                      ref.read(metronomeValueProvider.notifier).add();
                    },
                    child: Container(
                      width: 32,
                      height: 32,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: MaeumgagymColor.gray50,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: SvgPicture.asset(
                        "assets/image/add_icon.svg",
                        width: 16,
                        height: 16,
                        color: MaeumgagymColor.black,
                      ),
                    ),
                  )
                ],
              ),
              GestureDetector(
                onTap: () {
                  if(metronomeState) {
                    ref.read(metronomeStateProvider.notifier).state = false;
                  } else {
                    ref.read(metronomeStateProvider.notifier).state = true;
                  }
                },
                child: Container(
                  width: 40,
                  height: 40,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: metronomeState ? MaeumgagymColor.gray50 : MaeumgagymColor.blue500,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: SvgPicture.asset(
                    metronomeState ? "assets/image/pause_icon.svg" : "assets/image/play_filled_icon.svg",
                    width: 20,
                    height: 20,
                    color: metronomeState ? MaeumgagymColor.black : MaeumgagymColor.white,
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
