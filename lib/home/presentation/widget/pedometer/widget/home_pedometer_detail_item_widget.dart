import 'package:flutter/material.dart';
import 'package:maeum_ga_gym_flutter/config/maeumgagym_color.dart';
import 'package:maeum_ga_gym_flutter/core/component/text/pretendard/ptd_text_widget.dart';

class HomePedometerDetailItemWidget extends StatelessWidget {
  final String title;
  final String value;

  const HomePedometerDetailItemWidget({
    super.key,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          PtdTextWidget.bodyLarge(
            title,
            MaeumgagymColor.black,
          ),
          PtdTextWidget.bodyLarge(
            value,
            MaeumgagymColor.gray500,
          ),
        ],
      ),
    );
  }
}
