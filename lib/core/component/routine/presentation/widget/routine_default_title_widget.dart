import 'package:flutter/material.dart';
import 'package:maeum_ga_gym_flutter/config/maeumgagym_color.dart';
import 'package:maeum_ga_gym_flutter/core/component/text/pretendard/ptd_text_widget.dart';

class RoutineDefaultTitleContainer extends StatelessWidget {
  final String title;
  final String subTitle;

  const RoutineDefaultTitleContainer({
    super.key,
    required this.title,
    required this.subTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PtdTextWidget.titleLarge(
          title,
          MaeumgagymColor.black,
        ),
        const SizedBox(height: 12),
        PtdTextWidget.bodyMedium(
          subTitle,
          MaeumgagymColor.gray600,
        ),
      ],
    );
  }
}
