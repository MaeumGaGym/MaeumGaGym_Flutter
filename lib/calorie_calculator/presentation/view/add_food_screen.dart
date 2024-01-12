import 'package:flutter/material.dart';

import 'package:maeum_ga_gym_flutter/calorie_calculator/presentation/widget/addFood/add_food_app_bar.dart';
import 'package:maeum_ga_gym_flutter/calorie_calculator/presentation/widget/addFood/add_food_tab_bar.dart';
import 'package:maeum_ga_gym_flutter/calorie_calculator/presentation/widget/addFood/add_food_text_field.dart';

import '../widget/addFood/add_food_tab_body.dart';

class AddFoodScreen extends StatefulWidget {
  const AddFoodScreen({super.key});

  @override
  State<AddFoodScreen> createState() => _AddFoodScreenState();
}

class _AddFoodScreenState extends State<AddFoodScreen> {
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
          const AddFoodTabBody(),
        ],
      ),
    );
  }
}
