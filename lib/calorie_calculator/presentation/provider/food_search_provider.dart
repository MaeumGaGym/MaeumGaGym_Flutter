import 'package:flutter_riverpod/flutter_riverpod.dart';

final foodSearchController =
    StateNotifierProvider<FoodSearchStateNotifier, FoodSearchControllerState>(
        (ref) {
  return FoodSearchStateNotifier();
});

class FoodSearchStateNotifier extends StateNotifier<FoodSearchControllerState> {
  FoodSearchStateNotifier() : super(const FoodSearchControllerState(value: ''));

  void saveText(String value) {
    state = FoodSearchControllerState(value: value);
  }
}

class FoodSearchControllerState {
  final String value;

  const FoodSearchControllerState({required this.value});
}
