import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maeumgagym_flutter/component/my_scaffold.dart';
import 'package:maeumgagym_flutter/presentation/timer_metronome/ui/widget/metronome/metronome_app_bar.dart';
import 'package:maeumgagym_flutter/presentation/timer_metronome/ui/widget/metronome/metronome_beat_picker_widget.dart';
import 'package:maeumgagym_flutter/presentation/timer_metronome/ui/widget/metronome/metronome_beat_widget.dart';
import 'package:maeumgagym_flutter/presentation/timer_metronome/ui/widget/metronome/metronome_bpm_widget.dart';
import 'package:maeumgagym_flutter/presentation/timer_metronome/ui/widget/metronome/metronome_buttons_widget.dart';
import 'package:maeumgagym_flutter/presentation/timer_metronome/ui/widget/metronome/metronome_volume_slider_widget.dart';
import 'package:maeumgagym_flutter/presentation/timer_metronome/view_model/metronome/metronome_state_cubit.dart';

class MetronomeScreen extends StatefulWidget {
  const MetronomeScreen({super.key});

  @override
  State<MetronomeScreen> createState() => _MetronomeScreenState();
}

class _MetronomeScreenState extends State<MetronomeScreen> {
  final LayerLink _volumeSliderLink = LayerLink();

  // @override
  // void initState() {
  //   super.initState();
  //   _volumeSliderLink = ;
  // }
  //
  // @override
  // void dispose() {
  //   super.dispose();
  //   _volumeSliderLink.
  // }

  @override
  Widget build(BuildContext context) {
    final metronomeState = context.watch<MetronomeStateCubit>().state;

    return MyScaffold(
      appBar: const MetronomeAppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 20.h),
        child: Stack(
          children: [
            Column(
              /// 일일이 SizedBox로 간격 지정해주니, 화면 길이가 안맞네요.
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const MetronomeBeatWidget(),
                const MetronomeBpmWidget(),
                const MetronomeBeatPickerWidget(),
                MetronomeButtonsWidget(volumeSliderLink: _volumeSliderLink),
                SizedBox(width: 0.w),
              ],
            ),
            /// 볼륨 설정이 true 일때
            if (metronomeState.onVolume)
              CompositedTransformFollower(
                link: _volumeSliderLink,
                offset: Offset(46.w / 2, -150.h),
                child: const MetronomeVolumeSliderWidget(),
              ),
          ],
        ),
      ),
    );
  }
}