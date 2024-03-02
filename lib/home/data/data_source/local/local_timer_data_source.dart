import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../../../domain/model/local_timer_model.dart';

class DurationLocalDataSource {
  Box<LocalTimerModel>? box;

  DurationLocalDataSource() {
    init();
  }

  Future<void> init() async {
    box = Hive.box<LocalTimerModel>('duration');
  }

  Future<List<LocalTimerModel>> getTimers() async {
    if (box == null) await init();

    List<LocalTimerModel> response = box!.values.toList();

    if (response.isEmpty) {
      await addTimer(
        timerId: 1,
        hours: 0,
        minutes: 0,
        seconds: 5,
      );

      response = box!.values.toList();
    }

    return response;
  }

  Future<void> addTimer(
      {int timerId = 0,
      int hours = 0,
      int minutes = 0,
      int seconds = 0}) async {
    if (box == null) await init();

    box!.add(
      LocalTimerModel(
        timerId: timerId,
        hours: hours,
        minutes: minutes,
        seconds: seconds,
      ),
    );
  }
}
