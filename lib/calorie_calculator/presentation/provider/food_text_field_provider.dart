import 'package:flutter_riverpod/flutter_riverpod.dart';

final foodTextFieldController = StateNotifierProvider<
    FoodTextFieldStateNotifier, FoodTextFieldControllerState>((ref) {
  return FoodTextFieldStateNotifier();
});

class FoodTextFieldStateNotifier
    extends StateNotifier<FoodTextFieldControllerState> {
  FoodTextFieldStateNotifier() : super(FoodTextFieldControllerState(value: ''));

  void saveText(String value) {
    state = FoodTextFieldControllerState(value: value);
  }
}

class FoodTextFieldControllerState {
  final String value;

  const FoodTextFieldControllerState({required this.value});
}
