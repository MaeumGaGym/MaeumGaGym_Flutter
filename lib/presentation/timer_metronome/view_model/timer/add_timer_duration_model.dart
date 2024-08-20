class AddTimerDurationModel {
  int hours;
  int minutes;
  int seconds;

  AddTimerDurationModel({
    required this.hours,
    required this.minutes,
    required this.seconds,
  });

  AddTimerDurationModel copyWith({int? hours, int? minutes, int? seconds}){
    return AddTimerDurationModel(
      hours: hours ?? this.hours,
      minutes: minutes ?? this.minutes,
      seconds: seconds ?? this.seconds,
    );
  }
}