import 'package:flutter/material.dart';
import 'package:maeum_ga_gym_flutter/config/maeumgagym_color.dart';
import 'package:maeum_ga_gym_flutter/home/presentation/widget/home_timer_and_metronome_tab_bar.dart';
import 'package:maeum_ga_gym_flutter/home/presentation/widget/metronome/container/home_metronome_beat_container.dart';
import 'package:maeum_ga_gym_flutter/home/presentation/widget/metronome/container/home_metronome_beat_selector_container.dart';
import 'package:maeum_ga_gym_flutter/home/presentation/widget/metronome/container/home_metronome_bpm_container.dart';
import 'package:maeum_ga_gym_flutter/home/presentation/widget/metronome/container/home_metronome_func_button_list_container.dart';
import 'package:maeum_ga_gym_flutter/home/presentation/widget/metronome/widget/home_metronome_app_bar.dart';

class HomeMetronomeScreen extends StatefulWidget {
  const HomeMetronomeScreen({super.key});

  @override
  State<HomeMetronomeScreen> createState() => _HomeMetronomeScreenState();
}

class _HomeMetronomeScreenState extends State<HomeMetronomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MaeumgagymColor.white,
      appBar: const HomeMetronomeAppBar(),
      body: const SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              HomeMetronomeBeatContainer(),
              HomeMetronomeBpmContainer(),
              HomeMetronomeBeatSelectorContainer(),
              HomeMetronomeFuncListContainer(),
              SizedBox(height: 40),
            ],
          ),
        ),
      ),
      bottomSheet: Container(
        color: MaeumgagymColor.white,
        child: const HomeTimerAndMetronomeTabBar(),
      ),
    );
  }
}
