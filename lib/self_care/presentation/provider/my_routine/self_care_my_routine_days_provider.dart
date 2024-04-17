import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maeum_ga_gym_flutter/self_care/domain/model/exercise_info_response_model.dart';

final selfCareMyRoutineDaysProvider = StateNotifierProvider.autoDispose<
    SelfCareMyRoutineDaysStateNotifier, Map<String, bool>>(
  (ref) => SelfCareMyRoutineDaysStateNotifier(),
);

class SelfCareMyRoutineDaysStateNotifier extends StateNotifier<Map<String, bool>> {
  SelfCareMyRoutineDaysStateNotifier()
      : super({
          "일": false,
          "월": false,
          "화": false,
          "수": false,
          "목": false,
          "금": false,
          "토": false,
        });

  void init(List<String> daysOfWeek) {
    state = Map.fromEntries(state.entries.map((entry) => MapEntry(entry.key, daysOfWeek.contains(entry.key))));
  }

  void changeDays(int index) {
    final day = state.keys.elementAt(index);
    state = Map.from(state)..[day] = !state[day]!;
  }
}
