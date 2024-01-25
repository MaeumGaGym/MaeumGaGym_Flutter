import 'package:flutter/material.dart';
import 'package:maeum_ga_gym_flutter/config/maeumgagym_color.dart';
import 'package:maeum_ga_gym_flutter/core/component/text/pretendard/ptd_text_widget.dart';
import 'package:maeum_ga_gym_flutter/self_care/presentation/widget/goal/widget/self_care_goal_time_table_widget.dart';
import 'package:maeum_ga_gym_flutter/self_care/presentation/widget/self_care_default_app_bar.dart';

class SelfCareGoalDetailScreen extends StatelessWidget {
  const SelfCareGoalDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MaeumgagymColor.white,
      appBar: const SelfCareDefaultAppBar(
        iconPath: "assets/image/core_icon/left_arrow_icon.svg",
        actionIconPath: "assets/image/core_icon/dots_vertical_icon.svg",
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PtdTextWidget.titleLarge(
                "공부하기",
                MaeumgagymColor.black,
              ),
              const SizedBox(height: 12),
              const SelfCareGoalTimeTableWidget(
                title: "시작",
                date: "12월 25일 (화) 오전 8:00",
              ),
              const SizedBox(height: 12),

              /// 패딩은 보기가 안좋아서 SizedBox 쓸게요
              const SelfCareGoalTimeTableWidget(
                title: "마감",
                date: "2024년 01월 01알 (화) 오전 8:00",
              ),
              const SizedBox(height: 32),
              PtdTextWidget.bodyMedium(
                "새해가 다가오기 전까지 열심히 공부하자.\n한 해의 끝도 공부와 함께.",
                MaeumgagymColor.black,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
