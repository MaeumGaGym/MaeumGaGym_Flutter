/// Package
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
    final foodDataState = ref.watch(foodDataController);
    final foodDataStateNotifier = ref.read(foodDataController.notifier);

    return ListView.builder(
      shrinkWrap: true,
      itemCount: foodDataState.foodData.length,
      itemBuilder: (context, index) {
        if (!(foodDataState.foodData[index]['state'])) {
          return const SizedBox.shrink();
        } else {
          /// List Contents
          return SizedBox(
            height: 72,
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
                        foodDataState.foodData[index]['foodName'],
                        MaeumgagymColor.black,
                      ),

                      /// 단위와 접시 ex) 중접시 1줄
                      PtdTextWidget.bodyMedium(
                        '${foodDataState.foodData[index]['plate']}(${foodDataState.foodData[index]['unitValue']}${foodDataState.foodData[index]['unit']})',
                        MaeumgagymColor.gray500,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      /// 칼로리 량
                      PtdTextWidget.labelLarge(
                        '${foodDataState.foodData[index]['kcal']}kcal',
                        MaeumgagymColor.black,
                      ),
                      const SizedBox(width: 16),

                      /// 삭제 버튼
                      GestureDetector(
                        onTap: () {
                          foodDataStateNotifier.changeState(
                            index,
                            foodDataState.foodData[index]['state'],
                          );
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
          );
        }
      },
    );
  }
}
