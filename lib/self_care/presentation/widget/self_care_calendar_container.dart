import 'package:flutter/material.dart';
import 'package:maeum_ga_gym_flutter/config/maeumgagym_color.dart';
import 'package:maeum_ga_gym_flutter/core/component/text/pretendard/ptd_text_widget.dart';

class SelfCareCalendarContainer extends StatelessWidget {
  const SelfCareCalendarContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const SizedBox(width: 10),
              PtdTextWidget.titleMedium(
                "타임라인",
                MaeumgagymColor.black,
              ),
              const SizedBox(width: 12),
              PtdTextWidget.titleSmall(
                "2023년 12월",
                MaeumgagymColor.gray400,
              ),
            ],
          )
        ],
      ),
    );
  }
}
