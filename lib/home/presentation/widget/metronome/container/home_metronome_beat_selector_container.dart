import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maeum_ga_gym_flutter/config/maeumgagym_color.dart';
import 'package:maeum_ga_gym_flutter/core/component/text/pretendard/ptd_text_widget.dart';
import 'package:maeum_ga_gym_flutter/home/presentation/providers/metronome_state_provider.dart';
import 'package:numberpicker/numberpicker.dart';

class HomeMetronomeBeatSelectorContainer extends ConsumerStatefulWidget {
  const HomeMetronomeBeatSelectorContainer({super.key});

  @override
  ConsumerState<HomeMetronomeBeatSelectorContainer> createState() =>
      _HomeMetronomeBeatSelectorContainerState();
}

class _HomeMetronomeBeatSelectorContainerState
    extends ConsumerState<HomeMetronomeBeatSelectorContainer> {
  late FixedExtentScrollController beatController;

  @override
  void initState() {
    super.initState();
    beatController = FixedExtentScrollController();
  }

  @override
  Widget build(BuildContext context) {
    final metronomeState = ref.watch(metronomeController);
    final metronomeNotifier = ref.read(metronomeController.notifier);
    return SizedBox(
      height: 82,
      child: Column(
        children: [
          PtdTextWidget.bodyLarge(
            "비트수",
            MaeumgagymColor.blue400,
          ),
          /// horizontal 스크롤 피커가 없어서, 라이브러리 사용했습니다.
          NumberPicker(
            axis: Axis.horizontal,
            itemHeight: 45,
            itemWidth: 45.0,
            selectedTextStyle: TextStyle(
              color: MaeumgagymColor.black,
              fontSize: 32,
              fontFamily: pretendard,
              fontWeight: FontWeight.w300,
            ),
            textStyle: TextStyle(
              color: MaeumgagymColor.gray300,
              fontSize: 32,
              fontFamily: pretendard,
              fontWeight: FontWeight.w300,
            ),
            itemCount: 5,
            value: metronomeState.initialBeat,
            minValue: 1,
            maxValue: 10,
            onChanged: (value) {
              metronomeNotifier.changeBeat(value);
            },
          ),
        ],
      ),
    );
  }
}
