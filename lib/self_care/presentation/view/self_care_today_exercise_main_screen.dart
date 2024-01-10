import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:maeum_ga_gym_flutter/config/maeumgagym_color.dart';
import 'package:maeum_ga_gym_flutter/core/component/text/pretendard/ptd_text_widget.dart';
import 'package:maeum_ga_gym_flutter/self_care/presentation/widget/self_care_default_app_bar.dart';
import 'package:maeum_ga_gym_flutter/self_care/presentation/widget/today_exercise/self_care_today_exercise_fab.dart';
import 'package:maeum_ga_gym_flutter/self_care/presentation/widget/today_exercise/self_care_today_exercise_main_title.dart';
import 'package:maeum_ga_gym_flutter/self_care/presentation/widget/today_exercise/self_care_today_exercise_page_container.dart';
import 'package:maeum_ga_gym_flutter/self_care/presentation/widget/today_exercise/self_care_today_exercise_tab_bar.dart';

class SelfCareTodayExerciseMainScreen extends StatefulWidget {
  const SelfCareTodayExerciseMainScreen({Key? key}) : super(key: key);

  @override
  State<SelfCareTodayExerciseMainScreen> createState() => _SelfCareTodayExerciseMainScreenState();
}

class _SelfCareTodayExerciseMainScreenState extends State<SelfCareTodayExerciseMainScreen> {
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
              SizedBox(height: 32),
              SelfCareTodayExercisePageContainer(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const SelfCareTodayExerciseTabBar(),
      floatingActionButton: const SelfCareTodayExerciseFAB(),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
