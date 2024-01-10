import 'package:flutter/material.dart';
import 'package:maeum_ga_gym_flutter/config/maeumgagym_color.dart';
import 'package:maeum_ga_gym_flutter/self_care/presentation/widget/self_care_default_app_bar.dart';
import 'package:maeum_ga_gym_flutter/self_care/presentation/widget/today_exercise/self_care_today_exercise_main_title.dart';

class SelfCareTodayExerciseMainScreen extends StatelessWidget {
  const SelfCareTodayExerciseMainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MaeumgagymColor.white,
      appBar: SelfCareDefaultAppBar(
        iconPath: "assets/image/core_icon/left_arrow_icon.svg",
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SelfCareTodayExerciseMainTitle(),
            ],
          ),
        ),
      ),
    );
  }
}
