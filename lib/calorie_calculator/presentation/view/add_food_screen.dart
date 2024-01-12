import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maeum_ga_gym_flutter/calorie_calculator/presentation/provider/food_tab_bar_controller.dart';

import 'package:maeum_ga_gym_flutter/calorie_calculator/presentation/widget/addFood/add_food_app_bar.dart';
import 'package:maeum_ga_gym_flutter/calorie_calculator/presentation/widget/addFood/add_food_tab_bar.dart';
import 'package:maeum_ga_gym_flutter/calorie_calculator/presentation/widget/addFood/add_food_text_field.dart';

import '../widget/addFood/add_food_tab_body.dart';

class AddFoodScreen extends ConsumerStatefulWidget {
  const AddFoodScreen({super.key});

  @override
  ConsumerState<AddFoodScreen> createState() => _AddFoodScreenState();
}

class _AddFoodScreenState extends ConsumerState<AddFoodScreen> {
  final textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AddFoodAppBar(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                const SizedBox(height: 6),
                AddFoodTextField(textController: textController),
                const SizedBox(height: 16),
              ],
            ),
          ),
          const AddFoodTabBar(),
          IndexedStack(
            index: ref.watch(foodTabController).index,
            children: [
              for (int i = 0; i < tabData.length; i++)
                AddFoodTabBody(tabName: tabData[i]),
            ],
          ),
        ],
      ),
    );
  }
}
