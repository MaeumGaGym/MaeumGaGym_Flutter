import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maeumgagym_flutter/domain/metronome/entity/metronome_entity.dart';
import 'package:maeumgagym_flutter/presentation/timer_metronome/view_model/metronome/metronome_state_cubit.dart';

import '../../../../../core/maeum/maeum_color.dart';
import '../../../../../core/maeum/maeum_text.dart';

class MetronomeBeatPickerWidget extends StatelessWidget {
  const MetronomeBeatPickerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MetronomeStateCubit, MetronomeEntity>(
      builder: (_, state) {
        return Column(
          children: [
            MaeumText.bodyLarge("비트수", MaeumColor.blue500),
            SizedBox(height: 10.h),
            SizedBox(
              height: 50.h,
              child: RotatedBox(
                quarterTurns: 3,
                child: ListWheelScrollView.useDelegate(
                  itemExtent: 120,
                  controller: FixedExtentScrollController(initialItem: state.initialBeat - 1),
                  physics: const FixedExtentScrollPhysics(),
                  squeeze: 1.5,
                  onSelectedItemChanged: (value) {
                    context.read<MetronomeStateCubit>().changeBeat(value + 1);
                  },
                  childDelegate: ListWheelChildBuilderDelegate(
                    childCount: 16,
                    builder: (_, i) {
                      int index = i + 1;

                      return RotatedBox(
                        quarterTurns: 1,
                        child: MaeumText.metronomeBeat(
                          "$index",
                          index == state.initialBeat
                              ? MaeumColor.black
                              : MaeumColor.gray300,
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
