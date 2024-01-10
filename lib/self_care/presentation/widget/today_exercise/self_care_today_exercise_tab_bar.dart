import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maeum_ga_gym_flutter/config/maeumgagym_color.dart';
import 'package:maeum_ga_gym_flutter/core/component/text/pretendard/ptd_text_widget.dart';
import 'package:maeum_ga_gym_flutter/self_care/presentation/provider/self_care_today_exercise_tab_bar_provider.dart';

class SelfCareTodayExerciseTabBar extends ConsumerWidget {
  const SelfCareTodayExerciseTabBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final exerciseTabBarState = ref.watch(exerciseTabBarNotifierProvider);
    final exerciseTabBarNotifier = ref.read(exerciseTabBarNotifierProvider.notifier);
    final pageController = ref.read(exercisePageControllerProvider.notifier);
    return SizedBox(
      height: 72,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              exerciseTabBarNotifier.changeCamera();
              pageController.state.jumpToPage(0);
            },
            child: Container(
              width: 83,
              height: 40,
              decoration: BoxDecoration(
                color: exerciseTabBarState == ExerciseTabBarState.camera
                    ? MaeumgagymColor.gray50
                    : MaeumgagymColor.white,
                borderRadius: BorderRadius.circular(100),
              ),
              child: Center(
                child: PtdTextWidget.labelLarge(
                  "사진",
                  exerciseTabBarState == ExerciseTabBarState.camera
                      ? MaeumgagymColor.blue500
                      : MaeumgagymColor.gray400,
                ),
              ),
            ),
          ),
          const SizedBox(width: 16),
          GestureDetector(
            onTap: () {
              exerciseTabBarNotifier.changeGallery();
              pageController.state.jumpToPage(1);
            },
            child: Container(
              width: 83,
              height: 40,
              decoration: BoxDecoration(
                color: exerciseTabBarState == ExerciseTabBarState.gallery
                    ? MaeumgagymColor.gray50
                    : MaeumgagymColor.white,
                borderRadius: BorderRadius.circular(100),
              ),
              child: Center(
                child: PtdTextWidget.labelLarge(
                  "앨범",
                  exerciseTabBarState == ExerciseTabBarState.gallery ? MaeumgagymColor.blue500 : MaeumgagymColor.gray400,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
