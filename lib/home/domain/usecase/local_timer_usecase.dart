import '../model/local_timer_model.dart';
import '../repository/local_timer_repository.dart';

class DurationUseCase {
  final DurationRepository _repository;

  DurationUseCase(this._repository);

  Future<void> addTimers(
      {int timerId = 0,
      int hours = 0,
      int minutes = 0,
      int seconds = 0}) async {
    return await _repository.addTimers(
      timerId: timerId,
      hours: hours,
      minutes: minutes,
      seconds: seconds,
    );
  }

  Future<List<LocalTimerModel>> getTimers() async {
    return await _repository.getTimers();
  }

  Future<void> delTimers() async {
    return _repository.delTimers();
  }
}
