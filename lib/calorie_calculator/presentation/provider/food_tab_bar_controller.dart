import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Tab에 들어갈 데이터
List<String> tabData = [
  "MY",
  "전체",
  "과자/아이스크림",
  "음료",
  "과일/견과류",
  "한식",
  "양식/중식",
  "패스트푸드",
  "채소"
];

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
