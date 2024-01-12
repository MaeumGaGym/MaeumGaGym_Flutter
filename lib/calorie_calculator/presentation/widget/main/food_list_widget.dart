/// Package
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Core
import '../../../../config/maeumgagym_color.dart';
import '../../../../core/component/text/pretendard/ptd_text_widget.dart';

/// Provider
import 'package:maeum_ga_gym_flutter/calorie_calculator/presentation/provider/food_list_provider.dart';

class FoodListWidget extends ConsumerStatefulWidget {
  const FoodListWidget({super.key});

  @override
  ConsumerState<FoodListWidget> createState() => _FoodListWidgetState();
}

class _FoodListWidgetState extends ConsumerState<FoodListWidget> {
  @override
  Widget build(BuildContext context) {
    final listController = ref.watch(foodListController);
    final listControllerNotifier = ref.read(foodListController.notifier);

    return ListView.builder(
      shrinkWrap: true,
      itemCount: listController.length,
      itemBuilder: (context, index) {
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
                      listController[index].title,
                      MaeumgagymColor.black,
                    ),

                    /// 단위와 접시 ex) 중접시 1줄
                    PtdTextWidget.bodyMedium(
                      '${listController[index].plate}(${listController[index].unitValue}${listController[index].unit})',
                      MaeumgagymColor.gray500,
                    ),
                  ],
                ),
                Row(
                  children: [
                    /// 칼로리 량
                    PtdTextWidget.labelLarge(
                      '${listController[index].calories}kcal',
                      MaeumgagymColor.black,
                    ),
                    const SizedBox(width: 16),

                    /// 삭제 버튼
                    GestureDetector(
                      onTap: () {
                        listControllerNotifier.delFoodList(index);
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
      },
    );
  }
}
