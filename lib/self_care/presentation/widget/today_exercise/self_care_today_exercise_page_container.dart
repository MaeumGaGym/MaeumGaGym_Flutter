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

class _SelfCareTodayExercisePageContainerState
    extends ConsumerState<SelfCareTodayExercisePageContainer> {
  late PageController _pageController;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final exerciseTabBarState = ref.watch(exerciseTabBarNotifierProvider);
    return PageView(
      controller: _pageController,
      children: [
        SelfCareTodayExerciseCameraScreen(),
        SelfCareTodayExerciseGalleryScreen(),
      ],
    );
  }
}
