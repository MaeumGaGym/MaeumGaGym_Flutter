import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maeum_ga_gym_flutter/config/maeumgagym_color.dart';
import 'package:maeum_ga_gym_flutter/home/presentation/providers/metronome_state_provider.dart';
import 'package:maeum_ga_gym_flutter/home/presentation/widget/metronome/container/home_metronome_beat_container.dart';
import 'package:maeum_ga_gym_flutter/home/presentation/widget/metronome/container/home_metronome_beat_selector_container.dart';
import 'package:maeum_ga_gym_flutter/home/presentation/widget/metronome/container/home_metronome_bpm_container.dart';
import 'package:maeum_ga_gym_flutter/home/presentation/widget/metronome/container/home_metronome_func_button_list_container.dart';
import 'package:maeum_ga_gym_flutter/home/presentation/widget/metronome/widget/home_metronome_app_bar.dart';
import 'package:maeum_ga_gym_flutter/home/presentation/widget/metronome/widget/home_metronome_volume_controller_slider.dart';

class HomeMetronomeScreen extends ConsumerStatefulWidget {
  const HomeMetronomeScreen({super.key});

  @override
  ConsumerState<HomeMetronomeScreen> createState() => _HomeMetronomeScreenState();
}

class _HomeMetronomeScreenState extends ConsumerState<HomeMetronomeScreen> {
  @override
  Widget build(BuildContext context) {
    final metronomeState = ref.watch(metronomeController);
    return Scaffold(
      backgroundColor: MaeumgagymColor.white,
      appBar: const HomeMetronomeAppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
          child: Stack(
            children: [
              const Column(
                /// 일일이 SizedBox로 간격 지정해주니, 화면 길이가 안맞네요.
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  HomeMetronomeBeatContainer(),
                  HomeMetronomeBpmContainer(),
                  HomeMetronomeBeatSelectorContainer(),
                  HomeMetronomeFuncListContainer(),

                  /// 화면 오류나서 패딩 뺏습니다.
                ],
              ),
              /// 볼륨 설정이 true 일때
              if (metronomeState.onVolume)
                const Positioned(
                  bottom: 152,
                  right: 50,
                  child: HomeMetronomeVolumeControllerSlider(),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
