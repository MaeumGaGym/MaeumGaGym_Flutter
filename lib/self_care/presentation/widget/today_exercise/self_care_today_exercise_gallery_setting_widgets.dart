import 'package:flutter/material.dart';
import 'package:maeum_ga_gym_flutter/core/component/image/image_widget.dart';
import 'package:maeum_ga_gym_flutter/core/component/image/images.dart';

class SelfCareTodayExerciseGallerySettingWidgets extends StatelessWidget {
  const SelfCareTodayExerciseGallerySettingWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        ImageWidget(
          image:  Images.editAdd,
        ),
      ],
    );
  }
}
