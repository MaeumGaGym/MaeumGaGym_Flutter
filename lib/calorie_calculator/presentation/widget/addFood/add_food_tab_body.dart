/// Package
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Provider
import 'package:maeum_ga_gym_flutter/calorie_calculator/presentation/provider/food_data_provider.dart';

/// Widget
import 'package:maeum_ga_gym_flutter/calorie_calculator/presentation/widget/addFood/add_food_tab_body_list_widget.dart';

class AddFoodTabBody extends ConsumerWidget {
  final String tabName;

  const AddFoodTabBody({super.key, required this.tabName});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final foodDataState = ref.watch(foodDataController);
    final foodDataStateNotifier = ref.read(foodDataController.notifier);

    return Padding(
      padding: const EdgeInsets.all(20),
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: foodDataState.foodData.length,
        itemBuilder: (context, index) {
          final List<String> category =
              foodDataState.foodData[index]['category'];

          /// Category에 tabName이 없다면 SizedBox.shrink()
          if (!(category.contains(tabName))) {
            return const SizedBox.shrink();
          } else {
            /// AddFoodTabBodyListWidget
            return AddFoodTabBodyListWidget(
              index: index,
              g: foodDataState.foodData[index]['g'],
              kcal: foodDataState.foodData[index]['kcal'],
              image: foodDataState.foodData[index]['image'],
              foodName: foodDataState.foodData[index]['foodName'],
              state: foodDataState.foodData[index]['state'],
              foodDataStateNotifier: foodDataStateNotifier,
            );
          }
        },
      ),
    );
  }
}
