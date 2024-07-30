import 'package:flutter_riverpod/flutter_riverpod.dart';

final selfCareMyRoutineDaysProvider = StateNotifierProvider.autoDispose<
    SelfCareMyRoutineDaysStateNotifier, Map<String, bool>>(
  (ref) => SelfCareMyRoutineDaysStateNotifier(),
);

final selfCareMyRoutineSelectedDaysProvider = StateProvider.autoDispose<List<String>>((ref) => []);

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

  /// 날짜를 서버에서 받아와서, List 안에 있는 요일은 true로 설정
  void init(List<String> daysOfWeek) {
    state = Map.fromEntries(state.entries.map((entry) => MapEntry(entry.key, daysOfWeek.contains(entry.key))));
  }

  void changeDays(int index) {
    final day = state.keys.elementAt(index);
    state = Map.from(state)..[day] = !state[day]!;
  }

  bool daysHaveTrue() {
    for(int i=0; i<state.length; i++){
      if(state[state.keys.elementAt(i)]!) return true;
    }

    return false;
  }
}
