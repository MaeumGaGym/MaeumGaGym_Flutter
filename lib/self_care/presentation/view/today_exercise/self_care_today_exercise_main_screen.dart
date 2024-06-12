import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maeum_ga_gym_flutter/config/maeumgagym_color.dart';
import 'package:maeum_ga_gym_flutter/self_care/presentation/provider/self_care_today_exercise_tab_bar_provider.dart';
import 'package:maeum_ga_gym_flutter/self_care/presentation/view/today_exercise/self_care_today_exercise_camera_screen.dart';
import 'package:maeum_ga_gym_flutter/self_care/presentation/view/today_exercise/self_care_today_exercise_gallery_screen.dart';
import 'package:maeum_ga_gym_flutter/self_care/presentation/widget/self_care_default_app_bar.dart';
import 'package:maeum_ga_gym_flutter/self_care/presentation/widget/self_care_default_title_widget.dart';
import 'package:maeum_ga_gym_flutter/self_care/presentation/widget/today_exercise/widget/self_care_today_exercise_fab.dart';
import 'package:maeum_ga_gym_flutter/self_care/presentation/widget/today_exercise/widget/self_care_today_exercise_tab_bar.dart';

/// stless로 하면 PageView 부분에서 에러나서 stful로 했습니다.
class SelfCareTodayExerciseMainScreen extends ConsumerStatefulWidget {
  const SelfCareTodayExerciseMainScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<SelfCareTodayExerciseMainScreen> createState() =>
      _SelfCareTodayExerciseMainScreenState();
}

class _SelfCareTodayExerciseMainScreenState
    extends ConsumerState<SelfCareTodayExerciseMainScreen> {
  @override
  Widget build(BuildContext context) {
    final pageController = ref.watch(exerciseTabBarNotifierProvider);
    return Scaffold(
      backgroundColor: MaeumgagymColor.white,
      appBar: const SelfCareDefaultAppBar(
        iconPath: "assets/image/core_icon/left_arrow_icon.svg",
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 24),

                /// 오운완, 페이지 기능 설명 위젯
                const SelfCareDefaultTitleContainer(
                  title: "오운완",
                  subTitle: "오늘의 운동을 완료하고,\n내 모습을 사진으로 남겨보세요.",
                ),
                const SizedBox(height: 32),

                /// 사진, 앨범 페이지 관리 container
                if (pageController == ExerciseTabBarState.camera)
                  const SelfCareTodayExerciseCameraScreen(),
                if (pageController == ExerciseTabBarState.gallery)
                  const SelfCareTodayExerciseGalleryScreen(),
              ],
            ),
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
