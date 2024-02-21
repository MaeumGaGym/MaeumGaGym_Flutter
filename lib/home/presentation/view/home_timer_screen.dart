import 'package:flutter/material.dart';
import 'package:maeum_ga_gym_flutter/config/maeumgagym_color.dart';
import 'package:maeum_ga_gym_flutter/home/presentation/widget/timer/container/home_timer_circular_timer_container.dart';
import 'package:maeum_ga_gym_flutter/home/presentation/widget/timer/container/home_timer_func_button_list_container.dart';
import 'package:maeum_ga_gym_flutter/home/presentation/widget/timer/container/home_timer_list_container.dart';
import 'package:maeum_ga_gym_flutter/home/presentation/widget/home_timer_and_metronome_tab_bar.dart';
import 'package:maeum_ga_gym_flutter/home/presentation/widget/timer/widget/home_timer_app_bar.dart';

class HomeTimerScreen extends StatefulWidget {
  const HomeTimerScreen({super.key});

  @override
  State<HomeTimerScreen> createState() => _HomeTimerScreenState();
}

class _HomeTimerScreenState extends State<HomeTimerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MaeumgagymColor.white,
      appBar: const HomeTimerAppBar(),
      body: const SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              HomeTimerCircularTimerContainer(),
              HomeTimerListContainer(),
              HomeTimerFuncButtonListContainer(),
              SizedBox(height: 20),
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
