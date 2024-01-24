import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../widget/food_data.dart';

final foodDataController =
    StateNotifierProvider<FoodDataStateNotifier, FoodDataState>((ref) {
  return FoodDataStateNotifier();
});

class FoodDataStateNotifier extends StateNotifier<FoodDataState> {
  FoodDataStateNotifier() : super(FoodDataState(foodData: basicsFoodData));

  void toggleSelection(int index) {
    state = state.copyWith(
      foodData: state.foodData.map((foodData) {
        if (state.foodData.indexOf(foodData) == index) {
          return foodData.copyWith(selected: !foodData.selected);
        }
        return foodData;
      }).toList(),
    );
  }

  void toggleUnit(int index) {
    state = state.copyWith(
        foodData: state.foodData.map((foodData) {
      if (state.foodData.indexOf(foodData) == index) {
        if (foodData.isGram) {
          return foodData.copyWith(
            isGram: !foodData.isGram,
            g: (foodData.g * foodData.constantG),
            kcal: (foodData.constantG * foodData.unitValue) * 2,
          );
        } else {
          return foodData.copyWith(
            isGram: !foodData.isGram,
            g: (foodData.g ~/ foodData.constantG),
            kcal: (foodData.g ~/ foodData.constantG) * 2,
          );
        }
      }
      return foodData;
    }).toList());
  }

  Future<void> updateUnitValue(int index, String value) async {
    state = state.copyWith(
        foodData: state.foodData.map((foodData) {
      if (state.foodData.indexOf(foodData) == index) {
        if (foodData.isGram) {
          return foodData.copyWith(
            unitValue: int.parse(value),
            g: int.parse(value),
            kcal: int.parse(value) * 2,
          );
        } else {
          return foodData.copyWith(
            unitValue: int.parse(value),
            kcal: (foodData.constantG * int.parse(value)) * 2,
            g: foodData.constantG * int.parse(value),
          );
        }
      }
      return foodData;
    }).toList());
  }

  void incrementUnitValue(int index) {
    state = state.copyWith(
        foodData: state.foodData.map((foodData) {
      if (state.foodData.indexOf(foodData) == index) {
        if (foodData.isGram) {
          return foodData.copyWith(
            kcal: foodData.g * 2,
            g: ++foodData.g,
            unitValue: ++foodData.unitValue,
          );
        } else {
          return foodData.copyWith(
            unitValue: ++foodData.unitValue,
            kcal: (foodData.constantG * foodData.unitValue) * 2,
            g: foodData.constantG * foodData.unitValue,
          );
        }
      }
      return foodData;
    }).toList());
  }

  void decrementUnitValue(int index) {
    state = state.copyWith(
        foodData: state.foodData.map((foodData) {
      if (state.foodData.indexOf(foodData) == index) {
        if (foodData.isGram) {
          return foodData.copyWith(
            kcal: foodData.g * 2,
            g: --foodData.g,
            unitValue: --foodData.unitValue,
          );
        } else {
          return foodData.copyWith(
            unitValue: --foodData.unitValue,
            kcal: (foodData.constantG * foodData.unitValue) * 2,
            g: foodData.constantG * foodData.unitValue,
          );
        }
      }
      return foodData;
    }).toList());
  }
}

class FoodDataState {
  List<FoodDataModel> foodData = [];

  FoodDataState({required this.foodData});

  FoodDataState copyWith({required List<FoodDataModel>? foodData}) {
    return FoodDataState(
      foodData: foodData ?? this.foodData,
    );
  }
}
