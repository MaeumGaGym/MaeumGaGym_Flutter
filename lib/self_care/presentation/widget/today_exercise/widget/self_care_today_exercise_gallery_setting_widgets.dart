import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SelfCareTodayExerciseGallerySettingWidgets extends StatelessWidget {
  const SelfCareTodayExerciseGallerySettingWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        SvgPicture.asset(
          "assets/image/self_care_icon/add_icon.svg",
        ),
        const SizedBox(width: 12),
        SvgPicture.asset(
          "assets/image/core_icon/dots_vertical_icon.svg",
        ),
      ],
    );
  }
}
