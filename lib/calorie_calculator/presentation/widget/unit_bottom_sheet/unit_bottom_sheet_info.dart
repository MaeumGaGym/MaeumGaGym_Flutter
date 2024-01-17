import 'package:flutter/material.dart';

import '../../../../config/maeumgagym_color.dart';
import '../../../../core/component/text/pretendard/ptd_text_widget.dart';

class UnitBottomSheetInfo extends StatelessWidget {
  final String foodName;
  final int g;

  const UnitBottomSheetInfo({
    super.key,
    required this.foodName,
    required this.g,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 24,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              PtdTextWidget.labelLarge(
                foodName,
                MaeumgagymColor.black,
              ),
              const SizedBox(width: 8),
              PtdTextWidget.bodySmall(
                "${g}g",
                MaeumgagymColor.gray400,
              ),
            ],
          ),

          /// BottomSheet 닫기
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Image.asset(
              'assets/image/core_icon/check_icon.png',
              width: 16,
              height: 10,
              color: MaeumgagymColor.blue500,
            ),
          )
        ],
      ),
    );
  }
}
