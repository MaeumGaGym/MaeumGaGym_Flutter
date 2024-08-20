import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maeumgagym_flutter/core/maeum/maeum_color.dart';
import 'package:maeumgagym_flutter/presentation/timer_metronome/view_model/metronome/metronome_state_cubit.dart';

import '../../../../../domain/metronome/entity/metronome_entity.dart';

class MetronomeBeatWidget extends StatelessWidget {
  const MetronomeBeatWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MetronomeStateCubit, MetronomeEntity>(
      builder: (_, state) {
        return SizedBox(
          height: 177.5.h,
          width: 1.sw,
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: _buildRows(state, state.initialBeat),
            ),
          ),
        );
      }
    );
  }

  List<Widget> _buildRows(MetronomeEntity metronomeState, int initialBeat) {
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
          padding: EdgeInsets.only(top: 20.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: _buildBeatWidgets(metronomeState, secondRowCount, startIndex: firstRowCount),
          ),
        )
    ];
  }

  List<Widget> _buildBeatWidgets(MetronomeEntity metronomeState, int count, {int startIndex = 0}) {
    /// 리스트에 위젯을 저장하여 사용
    List<Widget> beatWidgets = [];
    /// 비트수 만큼 추가
    for (int i = 0; i < count; i++) {
      beatWidgets.add(
        Padding(
          padding: EdgeInsets.only(right: i == count - 1 ? 0 : 40.w),
          child: Container(
            width: 30.w,
            /// 첫번째 비트인지 구함
            height: (i + startIndex) == 0 ? 48 : 30,
            decoration: BoxDecoration(
              /// 진행된 비트 - 1보다 작거나 같으면 blue, 아니면 gray
              color: (i + startIndex) <= metronomeState.currentBeat - 1 ? MaeumColor.blue400 : MaeumColor.gray100,
              borderRadius: BorderRadius.circular(100.r),
            ),
          ),
        ),
      );
    }
    return beatWidgets;
  }
}
