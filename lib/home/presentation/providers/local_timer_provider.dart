import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/repositoryImpl/local_timer_repository_impl.dart';
import '../../domain/model/local_timer_model.dart';
import '../../domain/usecase/local_timer_usecase.dart';

final localTimerController =
    StateNotifierProvider<LocalTimerProvider, List<LocalTimerModel>>((ref) {
  return LocalTimerProvider();
});

class LocalTimerProvider extends StateNotifier<List<LocalTimerModel>> {
  LocalTimerProvider() : super([]);

  final DurationUseCase _useCase = DurationUseCase(DurationRepositoryImpl());

  Future<void> addTimers(
      {int timerId = 0,
      int hours = 0,
      int minutes = 0,
      int seconds = 0}) async {
    await _useCase.addTimers(
      timerId: timerId,
      hours: hours,
      minutes: minutes,
      seconds: seconds,
    );
  }

  Future<void> delTimers(int timerId) async {
    await _useCase.delTimers(timerId);
  }

  Future<void> getTimers() async {
    List<LocalTimerModel> list = await _useCase.getTimers();
    state.clear();
    state.addAll(list);
  }
}
