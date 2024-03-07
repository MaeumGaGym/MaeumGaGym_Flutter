import 'package:flutter/material.dart';
import 'package:maeum_ga_gym_flutter/config/maeumgagym_color.dart';
import 'package:maeum_ga_gym_flutter/core/component/text/pretendard/ptd_text_widget.dart';

class HomeMetronomeSettingItemWidget extends StatelessWidget {
  final String title;
  final String value;

  const HomeMetronomeSettingItemWidget({
    super.key,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PtdTextWidget.metronomeSettingTitle(
            title,
            MaeumgagymColor.black,
          ),
          const SizedBox(height: 4),
          PtdTextWidget.labelMedium(
            value,
            MaeumgagymColor.gray400,
          ),
        ],
      ),
    );
  }
}
