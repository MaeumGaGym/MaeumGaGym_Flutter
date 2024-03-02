import 'package:hive/hive.dart';

part 'local_timer_model.g.dart';

@HiveType(typeId: 1) // 이것들을 해둬야 Adapter가 생성됨
class LocalTimerModel {
  @HiveField(1)
  final int timerId;

  @HiveField(2)
  final int hours;

  @HiveField(3)
  final int minutes;

  @HiveField(4)
  final int seconds;

  LocalTimerModel(
      {required this.timerId,
      required this.hours,
      required this.minutes,
      required this.seconds});

  factory LocalTimerModel.fromMap(Map<String, dynamic> map) {
    return LocalTimerModel(
      timerId: map['timerId'],
      hours: map['hours'],
      minutes: map['minutes'],
      seconds: map['seconds'],
    );
  }
}
