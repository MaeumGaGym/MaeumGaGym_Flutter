import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
  late PageController pageController;

  @override
  void initState() {
    pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller:,
      children: [
        SelfCareTodayExerciseCameraScreen(),
        SelfCareTodayExerciseGalleryScreen(),
      ],
    );
  }
}
