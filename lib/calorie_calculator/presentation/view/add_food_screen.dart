/// Package
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Screen
import '../widget/addFood/add_food_app_bar.dart';
import '../widget/addFood/add_food_tab_bar.dart';
import '../widget/addFood/add_food_text_field.dart';
import '../widget/addFood/add_food_tab_body.dart';

/// Provider
import 'package:maeum_ga_gym_flutter/calorie_calculator/presentation/provider/food_tab_bar_controller.dart';

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
      /// AddFoodAppBar
      appBar: const AddFoodAppBar(),
      body: Column(
        children: [
          /// AddFoodTextField
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

          /// AddFoodTabBar
          const AddFoodTabBar(),

          /// AddFoodTabBody
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
