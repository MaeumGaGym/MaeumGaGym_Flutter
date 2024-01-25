import 'package:flutter/material.dart';
import 'package:maeum_ga_gym_flutter/config/maeumgagym_color.dart';
import 'package:maeum_ga_gym_flutter/core/component/text/pretendard/ptd_text_widget.dart';

class SelfCareGoalTimeTableWidget extends StatelessWidget {
  final String title;
  final String date;

  const SelfCareGoalTimeTableWidget({
    super.key,
    required this.title,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        /// 세로 막대
        Container(
          width: 2,
          height: 18,
          decoration: BoxDecoration(
            color: MaeumgagymColor.blue500,
            borderRadius: BorderRadius.circular(1),
          ),
        ),
        const SizedBox(width: 8),
        PtdTextWidget.bodyMedium(
          title,
          MaeumgagymColor.gray600,
        ),
        const SizedBox(width: 20), // 12 + 8
        PtdTextWidget.bodyMedium(
          date,
          MaeumgagymColor.gray600,
        ),
      ],
    );
  }
}
