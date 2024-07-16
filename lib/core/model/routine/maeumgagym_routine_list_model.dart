import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maeum_ga_gym_flutter/core/component/pose/domain/model/pose_data_model.dart';

class MaeumgagymRoutineListModel {
  final List<RoutineModel> routineList;
  final AsyncValue<int> statusCode;

  MaeumgagymRoutineListModel({
    required this.routineList,
    required this.statusCode,
  });

  factory MaeumgagymRoutineListModel.fromJson(
      Map<String, dynamic> json, int? statusCode) {
    return MaeumgagymRoutineListModel(
      routineList: json['routine_list']
          .map<RoutineModel>(
              (data) => RoutineModel.fromJson(data))
          .toList(),
      statusCode: AsyncData(statusCode!),
    );
  }

  MaeumgagymRoutineListModel copyWith({
    List<RoutineModel>? routineList,
    AsyncValue<int>? statusCode,
  }) {
    return MaeumgagymRoutineListModel(
      routineList: routineList ?? this.routineList,
      statusCode: statusCode ?? this.statusCode,
    );
  }
}

class RoutineModel {
  final int id;
  final String routineName;
  final List<ExerciseInfoList> exerciseInfoResponseList;
  final List<String> dayOfWeeks;
  final RoutineStatus routineStatus;
  final bool? isCompleted;

  RoutineModel({
    required this.id,
    required this.routineName,
    required this.exerciseInfoResponseList,
    required this.dayOfWeeks,
    required this.routineStatus,
    required this.isCompleted,
  });

  factory RoutineModel.fromJson(Map<String, dynamic> json) {
    return RoutineModel(
      id: json['id'],
      routineName: json['routine_name'],
      exerciseInfoResponseList: json['exercise_info_response_list']
          .map<ExerciseInfoList>((item) => ExerciseInfoList.fromJson(item))
          .toList(),
      dayOfWeeks: List<String>.from(json['day_of_weeks']),
      routineStatus: RoutineStatus.fromJson(json['routine_status']),
      isCompleted: json['is_completed'],
    );
  }

  RoutineModel copyWith({
    int? id,
    String? routineName,
    List<ExerciseInfoList>? exerciseInfoResponseList,
    List<String>? dayOfWeeks,
    RoutineStatus? routineStatus,
    bool? isCompleted,
    AsyncValue<int>? statusCode,
  }) {
    return RoutineModel(
      id: id ?? this.id,
      routineName: routineName ?? this.routineName,
      exerciseInfoResponseList:
          exerciseInfoResponseList ?? this.exerciseInfoResponseList,
      dayOfWeeks: dayOfWeeks ?? this.dayOfWeeks,
      routineStatus: routineStatus ?? this.routineStatus,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }
}

class ExerciseInfoList {
  final PoseDataModel pose;
  final int repetitions;
  final int sets;

  ExerciseInfoList({
    required this.pose,
    required this.repetitions,
    required this.sets,
  });

  factory ExerciseInfoList.fromJson(Map<String, dynamic> json) {
    return ExerciseInfoList(
      pose: PoseDataModel.fromJson(json['pose']),
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

  RoutineStatus copyWith({required bool? isArchived, required bool? isShared}){
    return RoutineStatus(
      isArchived: isArchived ?? this.isArchived,
      isShared: isShared ?? this.isShared,
    );
  }
}