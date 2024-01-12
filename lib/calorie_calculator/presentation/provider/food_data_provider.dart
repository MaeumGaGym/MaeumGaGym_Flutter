import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maeum_ga_gym_flutter/pose/presentation/widget/pose_data.dart';

List<Map<String, dynamic>> data = [
  {
    "image": 'assets/image/core_icon/logo.png',
    "foodName": '감자',
    'g': 215,
    'kcal': 460,
    'state': false,
    'category': ['전체', '채소']
  },
  {
    "image": 'assets/image/core_icon/logo.png',
    "foodName": '감자',
    'g': 215,
    'kcal': 460,
    'state': false,
    'category': ['전체', '채소']
  },
  {
    "image": 'assets/image/core_icon/logo.png',
    "foodName": '감자',
    'g': 215,
    'kcal': 460,
    'state': false,
    'category': ['전체', '채소']
  },
  {
    "image": 'assets/image/core_icon/logo.png',
    "foodName": '감자',
    'g': 215,
    'kcal': 460,
    'state': false,
    'category': ['전체', '채소']
  },
];

final foodDataController =
    StateNotifierProvider<FoodDataStateNotifier, FoodDataState>((ref) {
  return FoodDataStateNotifier();
});

class FoodDataStateNotifier extends StateNotifier<FoodDataState> {
  FoodDataStateNotifier() : super(FoodDataState(foodData: data));

  void changeState(int index, bool nowState) {
    List<Map<String, dynamic>> tmpData = state.foodData;

    if (nowState) {
      tmpData[index]['state'] = false;
      state = FoodDataState(foodData: state.foodData);
    } else {
      tmpData[index]['state'] = true;
      state = FoodDataState(foodData: state.foodData);
    }
  }
}

class FoodDataState {
  List<Map<String, dynamic>> foodData = [];

  FoodDataState({required this.foodData});
}
