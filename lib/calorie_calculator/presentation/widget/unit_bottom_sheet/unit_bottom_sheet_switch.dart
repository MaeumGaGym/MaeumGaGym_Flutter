import 'package:flutter/material.dart';
import 'package:maeum_ga_gym_flutter/calorie_calculator/presentation/provider/food_data_provider.dart';

import '../../../../config/maeumgagym_color.dart';
import '../../../../core/component/text/pretendard/ptd_text_widget.dart';

class UnitBottomSheetSwitch extends StatelessWidget {
  final bool isGram;
  final int constantG, index;
  final FoodDataStateNotifier foodDataStateNotifier;

  const UnitBottomSheetSwitch({
    super.key,
    required this.index,
    required this.isGram,
    required this.constantG,
    required this.foodDataStateNotifier,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        /// 배경
        Container(
          width: MediaQuery.of(context).size.width - 40,
          height: 52,
          decoration: BoxDecoration(
            color: MaeumgagymColor.gray50,
            borderRadius: BorderRadius.circular(100),
          ),
        ),

        /// 실제로 보이는 파란색 바
        AnimatedAlign(
          alignment: isGram ? Alignment.centerRight : Alignment.centerLeft,
          duration: const Duration(milliseconds: 100),
          child: Container(
            width: (MediaQuery.of(context).size.width - 40) * 0.46,
            height: 52,
            decoration: BoxDecoration(
              color: MaeumgagymColor.blue400,
              borderRadius: BorderRadius.circular(100),
            ),
          ),
        ),

        /// 애니메이션이 작동할때 글자는 가만히 있어야함 그렇기에 따로 생성
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              alignment: Alignment.center,
              width: (MediaQuery.of(context).size.width - 40) * 0.46,
              height: 52,
              child: PtdTextWidget.labelMedium(
                '1개 단위 (${constantG}g)',
                isGram ? MaeumgagymColor.black : MaeumgagymColor.white,
              ),
            ),
            Container(
              alignment: Alignment.center,
              width: (MediaQuery.of(context).size.width - 40) * 0.46,
              height: 52,
              child: PtdTextWidget.labelMedium(
                'g',
                isGram ? MaeumgagymColor.white : MaeumgagymColor.black,
              ),
            ),
          ],
        ),

        /// 이건 보이지 않는 버른 이걸 누르면 파란색 바가 그 위치로 움직임
        GestureDetector(
          onTap: () => foodDataStateNotifier.toggleUnit(index),
          child: AnimatedAlign(
            alignment: !isGram ? Alignment.centerRight : Alignment.centerLeft,
            duration: const Duration(milliseconds: 100),
            child: Opacity(
              opacity: 0.0,
              child: Container(
                width: (MediaQuery.of(context).size.width - 40) * 0.46,
                height: 52,
                decoration: BoxDecoration(
                  color: MaeumgagymColor.black,
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
