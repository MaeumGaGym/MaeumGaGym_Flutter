import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maeum_ga_gym_flutter/config/maeumgagym_color.dart';
import 'package:maeum_ga_gym_flutter/home/presentation/models/metronome.dart';
import 'package:maeum_ga_gym_flutter/home/presentation/providers/metronome_state_provider.dart';

class HomeMetronomeBeatContainer extends ConsumerStatefulWidget {
  const HomeMetronomeBeatContainer({super.key});

  @override
  ConsumerState<HomeMetronomeBeatContainer> createState() =>
      _HomeMetronomeBeatContainerState();
}

class _HomeMetronomeBeatContainerState
    extends ConsumerState<HomeMetronomeBeatContainer> {
  @override
  Widget build(BuildContext context) {
    final metronomeState = ref.watch(metronomeController);

    return SizedBox(
      height: 177.5,
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: _buildRows(metronomeState, metronomeState.initialBeat),
      ),
    );
  }

  List<Widget> _buildRows(Metronome metronomeState, int initialBeat) {
    /// (비트)갯수가 5이하면 그대로, 아니라면 갯수를 2로 나눈 몫
    int firstRowCount = initialBeat <= 5 ? initialBeat : initialBeat ~/ 2;
    int secondRowCount = initialBeat - firstRowCount;

    return [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: _buildBeatWidgets(metronomeState, firstRowCount),
      ),
      /// 두 번째 줄이 존재하면
      if (secondRowCount > 0)
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: _buildBeatWidgets(metronomeState, secondRowCount, startIndex: firstRowCount),
          ),
        )
    ];
  }

  List<Widget> _buildBeatWidgets(Metronome metronomeState, int count, {int startIndex = 0}) {
    /// 리스트에 위젯을 저장하여 사용
    List<Widget> beatWidgets = [];
    /// 비트수 만큼 추가
    for (int i = 0; i < count; i++) {
      beatWidgets.add(
        Padding(
          padding: EdgeInsets.only(right: i == count - 1 ? 0 : 40),
          child: Container(
            width: 30,
            /// 첫번째 비트인지 구함
            height: (i + startIndex) == 0 ? 48 : 30,
            decoration: BoxDecoration(
              /// 진행된 비트 - 1보다 작거나 같으면 blue, 아니면 gray
              color: (i + startIndex) <= metronomeState.currentBeat - 1 ? MaeumgagymColor.blue400 : MaeumgagymColor.gray100,
              borderRadius: BorderRadius.circular(100),
            ),
          ),
        ),
      );
    }
    return beatWidgets;
  }
}
