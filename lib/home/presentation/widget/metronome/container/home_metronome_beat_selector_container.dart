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
    final metronomeBeatState = ref.watch(metronomeBeatProvider);
    final metronomeBeatNotifier = ref.read(metronomeBeatProvider.notifier);
    return SizedBox(
      height: 82,
      child: Column(
        children: [
          PtdTextWidget.bodyLarge(
            "비트수",
            MaeumgagymColor.blue400,
          ),
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
            value: metronomeBeatState,
            minValue: 1,
            maxValue: 10,
            onChanged: (value) {
              metronomeBeatNotifier.state = value;
            },
          ),
        ],
      ),
    );
  }
}
