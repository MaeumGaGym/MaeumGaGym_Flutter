/// Package
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:maeum_ga_gym_flutter/calorie_calculator/presentation/widget/main/calorie_calculator_button.dart';

/// Widget
import '../widget/main/calorie_calculator_app_bar.dart';
import '../widget/main/cumulative_caloriees_bar_widget.dart';
import '../widget/main/cumulative_calories_state_widget.dart';
import '../widget/main/food_list_widget.dart';

class CalorieCalculatorScreen extends StatelessWidget {
  const CalorieCalculatorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    /// 1000이 넘어갈때마다 ,가 찍히도록 만듬
    NumberFormat textFormet = NumberFormat('###,###,###,###');
    int caloriesState = 1080; // 선택된 칼로리
    int maxCaloriesState = 1774; // 고정 칼로리

    return Scaffold(
      appBar: const CalorieCalculatorAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            /// 누적 칼로리 State + Bar
            CumulativeCaloriesStateWidget(
              caloriesState: textFormet.format(caloriesState),
              maxCaloriesState: textFormet.format(maxCaloriesState),
            ),

            /// 누적 칼로리 Bar
            CumulativeCaloriesBarWidget(
              caloriesState: caloriesState,
              maxCaloriesState: maxCaloriesState,
            ),

            const SizedBox(height: 40),

            /// 음식 List
            const Expanded(
              child: FoodListWidget(),
            ),

            /// 음식 추가 버튼
            const CalorieCalculatorButton(),
          ],
        ),
      ),
    );
  }
}
