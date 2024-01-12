import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../widget/food_data.dart';

final foodDataController =
    StateNotifierProvider<FoodDataStateNotifier, FoodDataState>((ref) {
  return FoodDataStateNotifier();
});

class FoodDataStateNotifier extends StateNotifier<FoodDataState> {
  FoodDataStateNotifier() : super(FoodDataState(foodData: basicsFoodData));

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
