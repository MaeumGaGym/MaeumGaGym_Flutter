import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maeum_ga_gym_flutter/self_care/presentation/provider/self_care_today_exercise_tab_bar_provider.dart';
import 'package:maeum_ga_gym_flutter/self_care/presentation/view/self_care_today_exercise_camera_screen.dart';
import 'package:maeum_ga_gym_flutter/self_care/presentation/view/self_care_today_exercise_gallery_screen.dart';

class SelfCareTodayExercisePageContainer extends ConsumerStatefulWidget {
  const SelfCareTodayExercisePageContainer({Key? key}) : super(key: key);

  @override
  ConsumerState<SelfCareTodayExercisePageContainer> createState() =>
      _SelfCareTodayExercisePageContainerState();
}

class _SelfCareTodayExercisePageContainerState extends ConsumerState<SelfCareTodayExercisePageContainer> {

  @override
  Widget build(BuildContext context) {
    final pageController = ref.watch(exercisePageControllerProvider);
    return Expanded(
      child: PageView(
        controller: pageController,
        /// 화면을 터치로 밀어도 넘어가지 않도록 >> 디자인이 그럼
        physics: const NeverScrollableScrollPhysics(),
        children: const [
          /// camera, gallery 나눔
          SelfCareTodayExerciseCameraScreen(),
          SelfCareTodayExerciseGalleryScreen(),
        ],
      ),
    );
  }
}
