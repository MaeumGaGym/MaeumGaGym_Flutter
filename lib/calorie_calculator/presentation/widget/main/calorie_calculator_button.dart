/// Package
import 'package:flutter/material.dart';

/// Core
import '../../../../config/maeumgagym_color.dart';
import '../../../../core/component/text/pretendard/ptd_text_widget.dart';

class CalorieCalculatorButton extends StatelessWidget {
  const CalorieCalculatorButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Container(
        width: MediaQuery.of(context).size.width - 40,
        height: 58,
        decoration: BoxDecoration(
          color: MaeumgagymColor.blue500,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: PtdTextWidget.labelLarge(
            '음식 추가',
            MaeumgagymColor.white,
          ),
        ),
      ),
    );
  }
}
