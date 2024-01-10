import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:maeum_ga_gym_flutter/calorie_calculator/presentation/widget/main/calorie_calculator_button.dart';

import '../widget/main/calorie_calculator_app_bar.dart';
import '../widget/main/cumulative_caloriees_bar_widget.dart';
import '../widget/main/cumulative_calories_state_widget.dart';
import '../widget/main/food_list_widget.dart';

class CalorieCalculatorScreen extends StatelessWidget {
  const CalorieCalculatorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    NumberFormat textFormet = NumberFormat('###,###,###,###');
    int caloriesState = 1080; // 선택된 칼로리
    int maxCaloriesState = 1774; // 고정 칼로리

    return Scaffold(
      appBar: const CalorieCalculatorAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            CumulativeCaloriesStateWidget(
              caloriesState: textFormet.format(caloriesState),
              maxCaloriesState: textFormet.format(maxCaloriesState),
            ),
            CumulativeCaloriesBarWidget(
              caloriesState: caloriesState,
              maxCaloriesState: maxCaloriesState,
            ),
            const SizedBox(height: 40),
            const Expanded(
              child: FoodListWidget(),
            ),
            const CalorieCalculatorButton(),
          ],
        ),
      ),
    );
  }
}
