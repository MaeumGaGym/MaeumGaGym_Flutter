import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maeum_ga_gym_flutter/self_care/presentation/model/self_care_routine_item_model.dart';

final selfCareRoutineItemProvider = StateNotifierProvider<SelfCareRoutineItemNotifier, List<SelfCareRoutineItemModel>>((ref) {
  return SelfCareRoutineItemNotifier();
});

class SelfCareRoutineItemNotifier extends StateNotifier<List<SelfCareRoutineItemModel>> {
  SelfCareRoutineItemNotifier() : super([
    SelfCareRoutineItemModel(title: "주말 루틴"),
    SelfCareRoutineItemModel(title: "평일 루틴"),
  ]);

  /// 나중에 기능 구현하겠습니다.
  void addRoutineItem() {}

  /// 루틴 아이템 보관
  void keepRoutineItem(int index) {
    state[index].isKept = true;
    state = [...state];
    // 상태 변경
  }

  /// 루틴 아이템 사용
  void cancelKeepRoutineItem(int index) {
    state[index].isKept = false;
    state = [...state];
  }

  /// 루틴 아이템 공유
  void shareRoutineItem(int index) {
    state[index].isShared = true;
    state = [...state];
  }

  /// 루틴 아이템 공유 취소
  void cancelShareRoutineItem(int index) {
    state[index].isShared = false;
    state = [...state];
  }

  /// 루틴 아이템 삭제
  void deleteRoutineItem(int index) {
    state = List.from(state)..removeAt(index);
  }
}