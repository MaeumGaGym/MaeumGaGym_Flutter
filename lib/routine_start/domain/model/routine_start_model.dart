import '../../../core/model/routine/maeumgagym_routine_list_model.dart';

class RoutineStartModel {
  int routineId;
  RestTimer restTimer;
  List<ExerciseModel> exercises;

  RoutineStartModel({
    required this.routineId,
    required this.restTimer,
    required this.exercises,
  });

  factory RoutineStartModel.fromModel(int routineId, RestTimer restTimer,List<ExerciseInfoList> list){
    return RoutineStartModel(
        routineId: routineId,
        restTimer: restTimer,
        exercises: list.map((e) => ExerciseModel.fromModel(e)).toList(),
    );
  }
}

class ExerciseModel {
  final String? name;
  final int? id;
  final String? thumbnail;
  final int? sets;
  final int? repetitions;
  List<bool>? completes;

  ExerciseModel({
    required this.name,
    required this.id,
    required this.thumbnail,
    required this.sets,
    required this.repetitions,
    required this.completes,
  });

  factory ExerciseModel.fromModel(ExerciseInfoList exerciseInfoList) {
    return ExerciseModel(
      name: exerciseInfoList.pose.name,
      id: exerciseInfoList.pose.id,
      thumbnail: exerciseInfoList.pose.thumbnail,
      sets: exerciseInfoList.sets,
      repetitions: exerciseInfoList.repetitions,
      completes: List.generate(exerciseInfoList.sets!, (index) => false),
    );
  }

  ExerciseModel copyWith({
    final String? name,
    final int? id,
    final String? thumbnail,
    final int? sets,
    final int? repetitions,
    List<bool>? completes}) {
    return ExerciseModel(
      name: name ?? this.name,
      id: id ?? this.id,
      thumbnail: thumbnail ?? this.thumbnail,
      sets: sets ?? this.sets,
      repetitions: repetitions ?? this.repetitions,
      completes: completes ?? this.completes,
    );
  }
}

class RestTimer {
  Duration initialTime;
  Duration currentTime;

  RestTimer({
    required this.initialTime,
    required this.currentTime,
  });

  RestTimer copyWith({Duration? initialTime, Duration? currentTime}){
    return RestTimer(
      initialTime: initialTime ?? this.initialTime,
      currentTime: currentTime ?? this.currentTime,
    );
  }
}
