import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maeum_ga_gym_flutter/config/maeumgagym_color.dart';
import 'package:maeum_ga_gym_flutter/core/component/text/pretendard/ptd_text_widget.dart';
import 'package:maeum_ga_gym_flutter/home/presentation/providers/meal_state_provider.dart';
import 'package:maeum_ga_gym_flutter/home/presentation/widget/main_container_title.dart';

class MainTodayMealContainer extends ConsumerWidget {
  const MainTodayMealContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Map<String, List<num>> mealData = {
      "바나나": [100, 88.7],
      "샐러드": [100, 679.7],
      "오므라이스": [450, 730],
    };
    final mealState = ref.watch(mealStateProvider);
    return Container(
      decoration: BoxDecoration(
        color: MaeumgagymColor.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 24),
              child: MainContainerTitle(
                title: "오늘의 식단",
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      if (mealState != MealState.breakfast) {
                        ref.read(mealStateProvider.notifier).state =
                            MealState.breakfast;
                      }
                    },
                    child: Container(
                      width: 64,
                      height: 32,
                      decoration: BoxDecoration(
                        color: mealState == MealState.breakfast
                            ? MaeumgagymColor.blue500
                            : MaeumgagymColor.gray50,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Center(
                        child: mealState == MealState.breakfast
                            ? PtdTextWidget.titleSmall(
                                "아침",
                                MaeumgagymColor.white,
                              )
                            : PtdTextWidget.bodyMedium(
                                "아침",
                                MaeumgagymColor.black,
                              ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  GestureDetector(
                    onTap: () {
                      if (mealState != MealState.lunch) {
                        ref.read(mealStateProvider.notifier).state =
                            MealState.lunch;
                      }
                    },
                    child: Container(
                      width: 64,
                      height: 32,
                      decoration: BoxDecoration(
                        color: mealState == MealState.lunch
                            ? MaeumgagymColor.blue500
                            : MaeumgagymColor.gray50,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Center(
                        child: mealState == MealState.lunch
                            ? PtdTextWidget.titleSmall(
                                "점심",
                                MaeumgagymColor.white,
                              )
                            : PtdTextWidget.bodyMedium(
                                "점심",
                                MaeumgagymColor.black,
                              ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  GestureDetector(
                    onTap: () {
                      if (mealState != MealState.dinner) {
                        ref.read(mealStateProvider.notifier).state =
                            MealState.dinner;
                      }
                    },
                    child: Container(
                      width: 64,
                      height: 32,
                      decoration: BoxDecoration(
                        color: mealState == MealState.dinner
                            ? MaeumgagymColor.blue500
                            : MaeumgagymColor.gray50,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Center(
                        child: mealState == MealState.dinner
                            ? PtdTextWidget.titleSmall(
                                "저녁",
                                MaeumgagymColor.white,
                              )
                            : PtdTextWidget.bodyMedium(
                                "저녁",
                                MaeumgagymColor.black,
                              ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 18),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: mealData.length,
              itemBuilder: (context, index) {
                String key = mealData.keys.elementAt(index);
                return Column(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              PtdTextWidget.titleSmall(
                                key,
                                MaeumgagymColor.black,
                              ),
                              const SizedBox(width: 8),
                              PtdTextWidget.bodySmall(
                                "${mealData[key]![0]}g",
                                MaeumgagymColor.gray400,
                              ),
                            ],
                          ),
                          PtdTextWidget.bodyMedium(
                            "${mealData[key]![1]}kcal",
                            MaeumgagymColor.gray600,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: index == mealData.length - 1 ? 0 : 8),
                  ],
                );
              },
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
