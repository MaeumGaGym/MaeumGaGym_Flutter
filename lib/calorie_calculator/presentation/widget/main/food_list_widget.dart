/// Package

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maeum_ga_gym_flutter/calorie_calculator/presentation/view/calorie_unit_bottom_sheet.dart';

/// Core
import '../../../../config/maeumgagym_color.dart';
import '../../../../core/component/text/pretendard/ptd_text_widget.dart';

/// Provider
import 'package:maeum_ga_gym_flutter/calorie_calculator/presentation/provider/food_data_provider.dart';

class FoodListWidget extends ConsumerStatefulWidget {
  const FoodListWidget({super.key});

  @override
  ConsumerState<FoodListWidget> createState() => _FoodListWidgetState();
}

class _FoodListWidgetState extends ConsumerState<FoodListWidget> {
  @override
  Widget build(BuildContext context) {
    final foodDataState = ref.watch(foodDataController).foodData;
    final foodDataStateNotifier = ref.read(foodDataController.notifier);

    return ListView.builder(
      shrinkWrap: true,
      itemCount: foodDataState.length,
      itemBuilder: (context, index) {
        final foodName = foodDataState[index].foodName;
        final selected = foodDataState[index].selected;
        final kcal = foodDataState[index].kcal;
        final plate = foodDataState[index].plate;
        final unitValue = foodDataState[index].unitValue;
        final unit = foodDataState[index].unit;
        final isGram = foodDataState[index].isGram;
        final g = foodDataState[index].g;

        if (!(selected)) {
          return const SizedBox.shrink();
        } else {
          /// List Contents
          return GestureDetector(
            onTap: () {
              showModalBottomSheet(
                context: context,
                useSafeArea: false,
                isScrollControlled: true,
                constraints: BoxConstraints(
                  minHeight: 300,
                  minWidth: MediaQuery.of(context).size.width,
                  maxWidth: MediaQuery.of(context).size.width,
                ),
                builder: (context) {
                  return CalorieUnitBottomSheet(index: index);
                },
              );
            },
            child: Container(
              width: MediaQuery.of(context).size.width - 40,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        /// Title
                        PtdTextWidget.labelLarge(
                          foodName,
                          MaeumgagymColor.black,
                        ),

                        /// 단위와 접시 ex) 중접시 1줄
                        PtdTextWidget.bodyMedium(
                          isGram ? '${g}g' : '$plate($unitValue$unit)',
                          MaeumgagymColor.gray500,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        /// 칼로리 량
                        PtdTextWidget.labelLarge(
                          '${kcal}kcal',
                          MaeumgagymColor.black,
                        ),
                        const SizedBox(width: 16),

                        /// 삭제 버튼
                        GestureDetector(
                          onTap: () {
                            foodDataStateNotifier.toggleSelection(index);
                            setState(() {});
                          },
                          child: Image.asset(
                            'assets/image/core_icon/close_icon.png',
                            width: 12,
                            height: 12,
                            color: MaeumgagymColor.gray200,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
