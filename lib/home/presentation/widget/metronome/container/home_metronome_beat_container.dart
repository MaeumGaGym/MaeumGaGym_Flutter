import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maeum_ga_gym_flutter/config/maeumgagym_color.dart';
import 'package:maeum_ga_gym_flutter/home/presentation/providers/metronome_state_provider.dart';

class HomeMetronomeBeatContainer extends ConsumerStatefulWidget {
  const HomeMetronomeBeatContainer({super.key});

  @override
  ConsumerState<HomeMetronomeBeatContainer> createState() => _HomeMetronomeBeatContainerState();
}

class _HomeMetronomeBeatContainerState extends ConsumerState<HomeMetronomeBeatContainer> {
  @override
  Widget build(BuildContext context) {
    final metronomeBeatState = ref.watch(metronomeBeatProvider);

    /// 5보다 크면 >> 비트수를 2로 나눈 몫을 반올림한 값, 아니면 비트수를 반환
    int rowOneCount = (metronomeBeatState > 5) ? (metronomeBeatState) ~/ 2 : metronomeBeatState;
    /// 5보다 크면 >> 비트수 - 첫번째 줄의 비트수의 개수, 아니면 0
    int rowTwoCount = (metronomeBeatState > 5) ? metronomeBeatState - rowOneCount : 0;

    return Container(
      color: Colors.red,
      width: MediaQuery.of(context).size.width,
      height: 177.5,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          buildRow(rowOneCount, true),

          /// 0이 아니면
          if (rowTwoCount > 0) buildRow(rowTwoCount, false),
        ],
      ),
    );
  }

  /// 갯수, 첫번째 줄인지 여부를 받음
  Widget buildRow(int count, bool isFirstRow) {
    return Padding(
      padding: EdgeInsets.only(top: !isFirstRow ? 20 : 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          for (int i = 0; i < count; i++)
            Padding(
              padding: EdgeInsets.only(right: i + 1 == count ? 0 : 40),
              child: Container(
                width: 30,
                height: isFirstRow && i == 0 ? 48 : 30,
                decoration: BoxDecoration(
                  color: MaeumgagymColor.gray100,
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
