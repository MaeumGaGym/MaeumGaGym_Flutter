/// Package
import 'package:flutter/material.dart';

/// Core
import '../../../../config/maeumgagym_color.dart';
import '../../../../core/component/text/pretendard/ptd_text_widget.dart';

class CumulativeCaloriesStateWidget extends StatelessWidget {
  final String caloriesState, maxCaloriesState;

  const CumulativeCaloriesStateWidget({
    super.key,
    required this.caloriesState,
    required this.maxCaloriesState,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 52,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            /// 누적 칼로리 Title
            PtdTextWidget.labelLarge('누적 칼로리', MaeumgagymColor.black),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                /// 선택된 음식의 칼로리 량
                PtdTextWidget.titleMedium(caloriesState, MaeumgagymColor.black),

                /// 칼로리 백분위 기중
                PtdTextWidget.labelMedium(
                  ' / ${maxCaloriesState}kcal',
                  MaeumgagymColor.gray300,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
