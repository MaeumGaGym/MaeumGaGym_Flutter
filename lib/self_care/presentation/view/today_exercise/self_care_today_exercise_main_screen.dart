import 'package:flutter/material.dart';
import 'package:maeum_ga_gym_flutter/config/maeumgagym_color.dart';
import 'package:maeum_ga_gym_flutter/self_care/presentation/widget/self_care_default_app_bar.dart';
import 'package:maeum_ga_gym_flutter/self_care/presentation/widget/today_exercise/self_care_today_exercise_fab.dart';
import 'package:maeum_ga_gym_flutter/self_care/presentation/widget/today_exercise/self_care_today_exercise_main_title.dart';
import 'package:maeum_ga_gym_flutter/self_care/presentation/widget/today_exercise/self_care_today_exercise_page_container.dart';
import 'package:maeum_ga_gym_flutter/self_care/presentation/widget/today_exercise/self_care_today_exercise_tab_bar.dart';

/// stless로 하면 PageView 부분에서 에러나서 stful로 했습니다.
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
              /// 오운완, 페이지 기능 설명 위젯
              SelfCareTodayExerciseMainTitle(),
              SizedBox(height: 32),
              /// 사진, 앨범 페이지 관리 container
              SelfCareTodayExercisePageContainer(),
            ],
          ),
        ),
      ),
      /// Figma 디자인에 맞춘 Custom TabBar
      bottomNavigationBar: const SelfCareTodayExerciseTabBar(),
      /// FAB도 보기 좋게 따로 나눴습니다.
      floatingActionButton: const SelfCareTodayExerciseFAB(),
      /// FAB 위치 지정
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
