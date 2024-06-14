import 'package:flutter/material.dart';
import 'package:maeum_ga_gym_flutter/self_care/presentation/widget/today_exercise/self_care_today_exercise_gallery_album_widget.dart';
import 'package:maeum_ga_gym_flutter/self_care/presentation/widget/today_exercise/self_care_today_exercise_gallery_setting_widgets.dart';

class SelfCareTodayExerciseGalleryScreen extends StatelessWidget {
  const SelfCareTodayExerciseGalleryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SelfCareTodayExerciseGallerySettingWidgets(),
        const SizedBox(height: 32),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 126 / 170,
            mainAxisSpacing: 6,
            crossAxisSpacing: 6,
          ),
          itemCount: 20,
          itemBuilder: (context, index) {
            return const SelfCareTodayExerciseGalleryAlbumWidget();
          },
        ),
      ],
    );
  }
}
