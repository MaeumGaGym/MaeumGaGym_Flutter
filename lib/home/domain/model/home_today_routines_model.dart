import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeTodayRoutinesModel {
  final int? id;
  final String? routineName;
  final List<ExerciseInfoList>? exerciseInfoResponseList;
  final List<String>? dayOfWeeks;
  final RoutineStatus? routineStatus;
  final bool? isCompleted;
  final AsyncValue<int> statusCode;

  HomeTodayRoutinesModel({
    required this.id,
    required this.routineName,
    required this.exerciseInfoResponseList,
    required this.dayOfWeeks,
    required this.routineStatus,
    required this.isCompleted,
    required this.statusCode,
  });

  factory HomeTodayRoutinesModel.fromJson(
      Map<String, dynamic> json, int? statusCode) {
    return HomeTodayRoutinesModel(
      id: json['id'],
      routineName: json['routine_name'],
      exerciseInfoResponseList: json['exercise_info_response_list']
          .map<ExerciseInfoList>((item) => ExerciseInfoList.fromJson(item))
          .toList(),
      dayOfWeeks: List<String>.from(json['day_of_weeks']),
      routineStatus: RoutineStatus.fromJson(json['routine_status']),
      isCompleted: json['is_completed'],
      statusCode: AsyncData(statusCode!),
    );
  }

  HomeTodayRoutinesModel copyWith({
    int? id,
    String? routineName,
    List<ExerciseInfoList>? exerciseInfoResponseList,
    List<String>? dayOfWeeks,
    RoutineStatus? routineStatus,
    bool? isCompleted,
    AsyncValue<int>? statusCode,
  }) {
    return HomeTodayRoutinesModel(
      id: id ?? this.id,
      routineName: routineName ?? this.routineName,
      exerciseInfoResponseList:
          exerciseInfoResponseList ?? this.exerciseInfoResponseList,
      dayOfWeeks: dayOfWeeks ?? this.dayOfWeeks,
      routineStatus: routineStatus ?? this.routineStatus,
      isCompleted: isCompleted ?? this.isCompleted,
      statusCode: statusCode ?? this.statusCode,
    );
  }
}

class ExerciseInfoList {
  final PoseData pose;
  final int? repetitions;
  final int? sets;

  ExerciseInfoList({
    required this.pose,
    required this.repetitions,
    required this.sets,
  });

  factory ExerciseInfoList.fromJson(Map<String, dynamic> json) {
    return ExerciseInfoList(
      pose: PoseData.fromJson(json['pose']),
      repetitions: json['repetitions'],
      sets: json['sets'],
    );
  }
}

class RoutineStatus {
  final bool isArchived;
  final bool isShared;

  RoutineStatus({
    required this.isArchived,
    required this.isShared,
  });

  factory RoutineStatus.fromJson(Map<String, dynamic> json) {
    return RoutineStatus(
      isArchived: json['is_archived'],
      isShared: json['is_shared'],
    );
  }
}

class PoseData {
  final int? id;
  final bool? needMachine;
  final String? name;
  final List<String>? simplePart;
  final List<String>? exactPart;
  final String? thumbnail;

  PoseData({
    required this.id,
    required this.needMachine,
    required this.name,
    required this.simplePart,
    required this.exactPart,
    required this.thumbnail,
  });

  factory PoseData.fromJson(Map<String, dynamic> json) {
    return PoseData(
      id: json['id'],
      needMachine: json['need_machine'],
      name: json['name'],
      simplePart: List<String>.from(json['simple_part']),
      exactPart: List<String>.from(json['exact_part']),
      thumbnail: json['thumbnail'],
    );
  }
}
