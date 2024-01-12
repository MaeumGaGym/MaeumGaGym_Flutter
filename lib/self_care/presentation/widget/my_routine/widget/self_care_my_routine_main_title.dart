import 'package:flutter/material.dart';
import 'package:maeum_ga_gym_flutter/config/maeumgagym_color.dart';
import 'package:maeum_ga_gym_flutter/core/component/text/pretendard/ptd_text_widget.dart';

class SelfCareMyRoutineMainTitle extends StatelessWidget {
  const SelfCareMyRoutineMainTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PtdTextWidget.titleLarge(
          "내 루틴",
          MaeumgagymColor.black,
        ),
        const SizedBox(height: 12),
        PtdTextWidget.bodyMedium(
          "나만의 루틴을 구성하여\n규칙적인 운동을 해보세요.",
          MaeumgagymColor.gray600,
        ),
      ],
    );
  }
}
