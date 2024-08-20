import 'package:hive/hive.dart';
import 'package:maeumgagym_flutter/core/ignore/hive_timer_key.dart';
import 'package:maeumgagym_flutter/data/timer/dto/request/add_timer_request.dart';
import 'package:maeumgagym_flutter/domain/timer/entity/timer_entity.dart';
import 'package:maeumgagym_flutter/domain/timer/entity/timers_entity.dart';
import '../../dto/response/timer_dto.dart';

class LocalTimerDataSource {
  Box<TimerDto>? box;

  LocalTimerDataSource() {
    init();
  }

  Future<void> init() async {
    box = Hive.box<TimerDto>(hiveTimerKey);
  }

  Future<TimersEntity> getTimers() async {
    if (box == null) await init();

    List<TimerDto> response = box!.values.toList();

    TimersEntity timersEntity = TimersEntity(
      timers: response.map<TimerEntity>((e) => e.toEntity()).toList(),
    );

    return timersEntity;
  }

  Future<void> addTimer({required AddTimerRequest addTimerRequest}) async {
    if (box == null) await init();

    box!.add(addTimerRequest.toDto());
  }

  Future<void> delTimer({required int timerIndex}) async {
    if (box == null) await init();

    await box!.deleteAt(timerIndex);
  }
}