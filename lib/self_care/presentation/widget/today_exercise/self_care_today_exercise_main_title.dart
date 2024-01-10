import 'package:flutter/material.dart';
import 'package:maeum_ga_gym_flutter/config/maeumgagym_color.dart';
import 'package:maeum_ga_gym_flutter/core/component/text/pretendard/ptd_text_widget.dart';

class SelfCareTodayExerciseMainTitle extends StatelessWidget {
  const SelfCareTodayExerciseMainTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PtdTextWidget.titleLarge(
          "오운완",
          MaeumgagymColor.black,
        ),
        const SizedBox(height: 12),
        PtdTextWidget.bodyMedium(
          "오늘의 운동을 완료하고,\n내 모습을 사진으로 남겨보세요.",
          MaeumgagymColor.gray600,
        ),
      ],
    );
  }
}
