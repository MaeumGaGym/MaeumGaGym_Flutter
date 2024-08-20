import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maeumgagym_flutter/core/maeum/maeum_color.dart';
import 'package:maeumgagym_flutter/domain/metronome/entity/metronome_entity.dart';
import 'package:maeumgagym_flutter/presentation/timer_metronome/ui/widget/timer_metronome_button_widget.dart';
import 'package:maeumgagym_flutter/presentation/timer_metronome/view_model/metronome/metronome_state_cubit.dart';

import '../../../../../core/images.dart';

class MetronomeButtonsWidget extends StatelessWidget {
  final LayerLink volumeSliderLink;

  const MetronomeButtonsWidget({
    super.key,
    required this.volumeSliderLink,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MetronomeStateCubit, MetronomeEntity>(
      builder: (_, state) {
        final MetronomeStateCubit metronomeNotifier = context.read<MetronomeStateCubit>();

        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                /// 햅틱 설정 온오프
                metronomeNotifier.onVibration();
              },
              child: TimerMetronomeButtonWidget(
                width: 24.w,
                backgroundColor: state.onVibration ? MaeumColor.blue400 : MaeumColor.white,
                padding: 22.w,
                iconColor: state.onVibration ? MaeumColor.white : MaeumColor.blue400,
                iconPath: Images.iconsVibration,
              ),
            ),
            SizedBox(width: 24.w),
            GestureDetector(
              onTap: () {
                if (state.onPlay) {
                  metronomeNotifier.onPause();
                } else {
                  metronomeNotifier.onPlay();
                }
              },
              child: TimerMetronomeButtonWidget(
                width: 80.w,
                backgroundColor: MaeumColor.blue400,
                padding: 20.w,
                iconColor: MaeumColor.white,
                iconPath: state.onPlay ? Images.mediaPause : Images.mediaPlayFilled,
              ),
            ),
            SizedBox(width: 24.w),
            CompositedTransformTarget(
              link: volumeSliderLink,
              child: GestureDetector(
                onTap: () {
                  /// 볼륨 설정 온오프
                  metronomeNotifier.onVolume();
                },
                child: TimerMetronomeButtonWidget(
                  width: 24.w,
                  backgroundColor: MaeumColor.white,
                  padding: 22.w,
                  iconColor: MaeumColor.blue400,
                  iconPath: state.volume == 0
                      ? Images.mediaVolumeOff
                      : Images.mediaVolume,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
