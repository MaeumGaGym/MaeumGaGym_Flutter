import '../model/local_timer_model.dart';

abstract class DurationRepository {
  Future<List<LocalTimerModel>> getTimers();

  Future<void> addTimers(
      {int timerId = 0, int hours = 0, int minutes = 0, int seconds = 0});

  Future<void> delTimers();
}
