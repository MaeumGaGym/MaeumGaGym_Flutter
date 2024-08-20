import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maeumgagym_flutter/component/image_widget.dart';
import 'package:maeumgagym_flutter/core/images.dart';
import 'package:maeumgagym_flutter/core/maeum/maeum_color.dart';
import 'package:maeumgagym_flutter/core/maeum/maeum_text.dart';
import 'package:maeumgagym_flutter/domain/metronome/entity/metronome_entity.dart';
import 'package:maeumgagym_flutter/presentation/timer_metronome/view_model/metronome/metronome_state_cubit.dart';

class MetronomeBpmWidget extends StatelessWidget {
  const MetronomeBpmWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MetronomeStateCubit, MetronomeEntity>(
      builder: (_, state) {
        MetronomeStateCubit metronomeNotifier = context.read<MetronomeStateCubit>();

        return Column(
          children: [
            MaeumText.bodyLarge(
              "BPM",
              MaeumColor.blue400,
            ),
            SizedBox(height: 10.h),
            SizedBox(
              height: 64.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () => metronomeNotifier.decreaseBpm(),
                    child: Container(
                      height: 44.h,
                      padding: EdgeInsets.all(10.w),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: MaeumColor.gray50,
                      ),
                      child: ImageWidget(
                        image: Images.editRemoveMinus,
                        width: 24.w,
                        color: MaeumColor.gray300,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: MaeumText.onTimerAndMetronomeTitle(
                      state.bpm.toString(),
                      MaeumColor.black,
                    ),
                  ),
                  GestureDetector(
                    onTap: () => metronomeNotifier.increaseBpm(),
                    child: Container(
                      height: 44.h,
                      padding: EdgeInsets.all(10.w),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: MaeumColor.gray50,
                      ),
                      child: ImageWidget(
                        image: Images.editAdd,
                        width: 24.w,
                        color: MaeumColor.gray300,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Slider(
              activeColor: MaeumColor.blue400,
              inactiveColor: MaeumColor.gray100,
              thumbColor: MaeumColor.blue400,
              value: state.bpm.toDouble(),
              min: 1,
              max: 300,
              onChanged: (value) => metronomeNotifier.changeBpm(value.toInt()),
              onChangeStart: (_) => metronomeNotifier.onPause(),
              onChangeEnd: (_) => metronomeNotifier.onPlay(),
            ),
          ],
        );
      }
    );
  }
}
