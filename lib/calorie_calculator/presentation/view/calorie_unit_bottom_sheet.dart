import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maeum_ga_gym_flutter/calorie_calculator/presentation/provider/food_data_provider.dart';
import 'package:maeum_ga_gym_flutter/calorie_calculator/presentation/widget/unit_bottom_sheet/unit_bottom_sheet_info.dart';
import 'package:maeum_ga_gym_flutter/calorie_calculator/presentation/widget/unit_bottom_sheet/unit_bottom_sheet_switch.dart';
import 'package:maeum_ga_gym_flutter/calorie_calculator/presentation/widget/unit_bottom_sheet/unit_bottom_sheet_text_field.dart';

import '../../../config/maeumgagym_color.dart';
import '../../../core/component/text/pretendard/ptd_text_widget.dart';

class CalorieUnitBottomSheet extends ConsumerStatefulWidget {
  final int index;

  const CalorieUnitBottomSheet({
    super.key,
    required this.index,
  });

  @override
  ConsumerState<CalorieUnitBottomSheet> createState() =>
      _CalorieUnitBottomSheetState();
}

class _CalorieUnitBottomSheetState
    extends ConsumerState<CalorieUnitBottomSheet> {
  @override
  Widget build(BuildContext context) {
    final foodDataState = ref.watch(foodDataController).foodData;
    final foodDataStateNotifier = ref.read(foodDataController.notifier);

    final int index = widget.index;

    final String foodName = foodDataState[index].foodName;
    final int constantG = foodDataState[index].constantG;
    final int g = foodDataState[index].g;
    final bool isGram = foodDataState[index].isGram;
    final int unitValue = foodDataState[index].unitValue;
    final int kcal = foodDataState[index].kcal;

    return Container(
      width: MediaQuery.of(context).size.width,
      height: 300 + MediaQuery.of(context).viewInsets.bottom,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20),
          topLeft: Radius.circular(20),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 26, 20, 26),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// 음식 이름과 그램 수
            UnitBottomSheetInfo(foodName: foodName, g: g),

            const SizedBox(height: 20),

            /// 단위 지정 스위치
            UnitBottomSheetSwitch(
              index: index,
              isGram: isGram,
              constantG: constantG,
              foodDataStateNotifier: foodDataStateNotifier,
            ),

            const SizedBox(height: 20),

            /// 단위를 변경하는 TextField
            UnitBottomSheetTextField(
              index: index,
              textFieldValue: isGram ? g : unitValue,
              foodDataStateNotifier: foodDataStateNotifier,
            ),

            const SizedBox(height: 20),

            /// bottomSheet 칼로리 표시
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  PtdTextWidget.titleMedium(
                    '${kcal}kcal',
                    MaeumgagymColor.black,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
