import 'package:flutter_riverpod/flutter_riverpod.dart';

final foodTabController = StateNotifierProvider<FoodTabControllerStateNotifier,
    FoodTabControllerState>((ref) {
  return FoodTabControllerStateNotifier();
});

class FoodTabControllerStateNotifier
    extends StateNotifier<FoodTabControllerState> {
  FoodTabControllerStateNotifier() : super(FoodTabControllerState(index: 0));

  void saveIndex(int index) {
    state = FoodTabControllerState(index: index);
  }
}

class FoodTabControllerState {
  int index;

  FoodTabControllerState({required this.index});
}
