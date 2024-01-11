import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maeum_ga_gym_flutter/self_care/presentation/model/self_care_routine_item_model.dart';

class SelfCareRoutineItemNotifier extends StateNotifier<List<SelfCareRoutineItemModel>> {
  SelfCareRoutineItemNotifier() : super([]);

  void addRoutineItem() {}

  void useRoutineItem() {}

  void disuseRoutineItem() {}

  void shareRoutineItem() {}
}