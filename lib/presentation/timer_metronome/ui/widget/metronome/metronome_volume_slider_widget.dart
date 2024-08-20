import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maeumgagym_flutter/core/maeum/maeum_color.dart';
import 'package:maeumgagym_flutter/domain/metronome/entity/metronome_entity.dart';
import 'package:maeumgagym_flutter/presentation/timer_metronome/view_model/metronome/metronome_state_cubit.dart';

import '../../../../../core/maeum/maeum_text.dart';

class MetronomeVolumeSliderWidget extends StatefulWidget {
  const MetronomeVolumeSliderWidget({super.key});

  @override
  State<MetronomeVolumeSliderWidget> createState() => _MetronomeVolumeSliderWidgetState();
}

class _MetronomeVolumeSliderWidgetState extends State<MetronomeVolumeSliderWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MetronomeStateCubit, MetronomeEntity>(
        builder: (_, state) {
          return Container(
            height: 140.h,
            width: 19.w,
            decoration: BoxDecoration(
              color: MaeumColor.white,
              borderRadius: BorderRadius.circular(100.r),
              boxShadow: [
                BoxShadow(
                  color: MaeumColor.black.withOpacity(0.3),
                  blurRadius: 6.r,
                ),
              ],
            ),
            child: RotatedBox(
              /// 회전
              quarterTurns: 3,
              child: SliderTheme(
                data: SliderThemeData(
                  activeTrackColor: MaeumColor.blue400,
                  inactiveTrackColor: MaeumColor.gray100,
                  thumbColor: MaeumColor.blue400,
                  valueIndicatorColor: MaeumColor.black.withOpacity(0.3),
                  showValueIndicator: ShowValueIndicator.always,
                  valueIndicatorTextStyle: TextStyle(
                    fontFamily: pretendard,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: MaeumColor.white,
                    overflow: TextOverflow.visible,
                  ),
                ),
                child: Slider(
                  value: state.volume.toDouble(),
                  label: state.volume.toString(),
                  min: 0,
                  max: 10,
                  onChanged: (value) {
                    context.read<MetronomeStateCubit>().setVolume(value.toInt());
                  },
                ),
              ),
            ),
          );
        }
    );
  }
}