import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final foodListController = StateNotifierProvider<
    FoodListControllerStateNotifier, List<FoodListControllerState>>((ref) {
  return FoodListControllerStateNotifier();
});

class FoodListControllerStateNotifier
    extends StateNotifier<List<FoodListControllerState>> {
  FoodListControllerStateNotifier()
      : super(
          [
            FoodListControllerState(
              textController: TextEditingController(text: '0'),
              title: '김밥',
              calories: 0,
              plate: '중접시',
              unitValue: 1,
              unit: '줄',
            ),
            FoodListControllerState(
              textController: TextEditingController(text: '0'),
              title: '김밥',
              calories: 0,
              plate: '중접시',
              unitValue: 1,
              unit: '줄',
            ),
            FoodListControllerState(
              textController: TextEditingController(text: '0'),
              title: '김밥',
              calories: 0,
              plate: '중접시',
              unitValue: 1,
              unit: '줄',
            ),
          ],
        );

  void addFoodList(String title, String plate, String unit, int calories,
      int unitValue, int value) {
    state.add(
      FoodListControllerState(
        textController: TextEditingController(),
        title: title,
        calories: calories,
        plate: plate,
        unitValue: unitValue,
        unit: unit,
      ),
    );
  }

  void delFoodList(int index) {
    state.removeAt(index);
  }
}

class FoodListControllerState {
  final TextEditingController textController;
  final String title, plate, unit;
  final int calories, unitValue;

  const FoodListControllerState({
    required this.textController,
    required this.title,
    required this.calories,
    required this.plate,
    required this.unitValue,
    required this.unit,
  });
}
