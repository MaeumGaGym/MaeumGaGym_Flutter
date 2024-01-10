import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:maeum_ga_gym_flutter/config/maeumgagym_color.dart';
import 'package:maeum_ga_gym_flutter/self_care/presentation/widget/self_care_default_app_bar.dart';
import 'package:maeum_ga_gym_flutter/self_care/presentation/widget/today_exercise/self_care_today_exercise_main_title.dart';

class SelfCareTodayExerciseMainScreen extends StatelessWidget {
  const SelfCareTodayExerciseMainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MaeumgagymColor.white,
      appBar: const SelfCareDefaultAppBar(
        iconPath: "assets/image/core_icon/left_arrow_icon.svg",
      ),
      body: const SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SelfCareTodayExerciseMainTitle(),
            ],
          ),
        ),
      ),
      floatingActionButton: SizedBox(
        height: 64,
        width: 64,
        child: FloatingActionButton(
          onPressed: () {},
          shape: const CircleBorder(),
          backgroundColor: MaeumgagymColor.blue500,
          heroTag: "cameraButton",
          child: SvgPicture.asset(
            "assets/image/self_care_icon/camera_icon.svg",
            width: 40,
            height: 40,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
