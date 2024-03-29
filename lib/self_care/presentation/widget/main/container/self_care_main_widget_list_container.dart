import 'package:flutter/material.dart';
import 'package:maeum_ga_gym_flutter/config/maeumgagym_color.dart';
import 'package:maeum_ga_gym_flutter/core/component/text/pretendard/ptd_text_widget.dart';
import 'package:maeum_ga_gym_flutter/self_care/presentation/view/goal/self_care_goal_main_screen.dart';
import 'package:maeum_ga_gym_flutter/self_care/presentation/view/my_routine/self_care_my_routine_main_screen.dart';
import 'package:maeum_ga_gym_flutter/self_care/presentation/view/today_exercise/self_care_today_exercise_main_screen.dart';
import 'package:maeum_ga_gym_flutter/self_care/presentation/widget/main/widget/self_care_item_widget.dart';

class SelfCareMainWidgetListContainer extends StatelessWidget {
  const SelfCareMainWidgetListContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: PtdTextWidget.titleMedium(
              "자기관리",
              MaeumgagymColor.black,
            ),
          ),
          const SizedBox(height: 12),
          GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const SelfCareMyRoutineMainScreen(),
              ),
            ),
            child: const SelfCareItemWidget(
              imagePath: "assets/image/self_care_icon/routine_icon.svg",
              title: "내 루틴",
            ),
          ),
          GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const SelfCareGoalMainScreen(),
              ),
            ),
            child: const SelfCareItemWidget(
              imagePath: "assets/image/self_care_icon/objective_icon.svg",
              title: "목표",
            ),
          ),
          const SelfCareItemWidget(
            imagePath: "assets/image/self_care_icon/protein_shake_icon.svg",
            title: "식단",
          ),
          GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const SelfCareTodayExerciseMainScreen(),
              ),
            ),
            child: const SelfCareItemWidget(
              imagePath: "assets/image/self_care_icon/gallery_icon.svg",
              title: "오운완",
            ),
          ),
        ],
      ),
    );
  }
}
