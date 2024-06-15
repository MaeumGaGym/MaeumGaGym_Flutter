import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:maeum_ga_gym_flutter/config/maeumgagym_color.dart';
import 'package:maeum_ga_gym_flutter/core/component/text/pretendard/ptd_text_widget.dart';
import 'package:maeum_ga_gym_flutter/self_care/presentation/widget/calendar/self_care_calendar_widget.dart';

class SelfCareTimelineWidget extends StatelessWidget {
  const SelfCareTimelineWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final String now = DateFormat("yyyy년 MM월").format(DateTime.now());
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
                now,
                MaeumgagymColor.gray400,
              ),
            ],
          ),
          const SizedBox(height: 24),
          const SelfCareCalendarWidget(),
        ],
      ),
    );
  }
}
