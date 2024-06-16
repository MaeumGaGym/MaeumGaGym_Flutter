import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maeum_ga_gym_flutter/core/component/pose/domain/model/pose_data_model.dart';

class HomeTodayRoutineListModel {
  final List<HomeTodayRoutineModel> routineList;
  final AsyncValue<int> statusCode;

  HomeTodayRoutineListModel({
    required this.routineList,
    required this.statusCode,
  });

  factory HomeTodayRoutineListModel.fromJson(
      Map<String, dynamic> json, int? statusCode) {
    return HomeTodayRoutineListModel(
      routineList: json['routine_list']
          .map<HomeTodayRoutineModel>(
              (data) => HomeTodayRoutineModel.fromJson(data))
          .toList(),
      statusCode: AsyncData(statusCode!),
    );
  }

  HomeTodayRoutineListModel copyWith({
    List<HomeTodayRoutineModel>? routineList,
    AsyncValue<int>? statusCode,
  }) {
    return HomeTodayRoutineListModel(
      routineList: routineList ?? this.routineList,
      statusCode: statusCode ?? this.statusCode,
    );
  }
}

class HomeTodayRoutineModel {
  final int? id;
  final String? routineName;
  final List<ExerciseInfoList>? exerciseInfoResponseList;
  final List<String>? dayOfWeeks;
  final RoutineStatus? routineStatus;
  final bool? isCompleted;

  HomeTodayRoutineModel({
    required this.id,
    required this.routineName,
    required this.exerciseInfoResponseList,
    required this.dayOfWeeks,
    required this.routineStatus,
    required this.isCompleted,
  });

  factory HomeTodayRoutineModel.fromJson(Map<String, dynamic> json) {
    return HomeTodayRoutineModel(
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

  HomeTodayRoutineModel copyWith({
    int? id,
    String? routineName,
    List<ExerciseInfoList>? exerciseInfoResponseList,
    List<String>? dayOfWeeks,
    RoutineStatus? routineStatus,
    bool? isCompleted,
    AsyncValue<int>? statusCode,
  }) {
    return HomeTodayRoutineModel(
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
  final int? repetitions;
  final int? sets;

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
}

// class PoseData {
//   final int? id;
//   final bool? needMachine;
//   final String? name;
//   final List<String>? simplePart;
//   final List<String>? exactPart;
//   final String? thumbnail;
//
//   PoseData({
//     required this.id,
//     required this.needMachine,
//     required this.name,
//     required this.simplePart,
//     required this.exactPart,
//     required this.thumbnail,
//   });
//
//   factory PoseData.fromJson(Map<String, dynamic> json) {
//     return PoseData(
//       id: json['id'],
//       needMachine: json['need_machine'],
//       name: json['name'],
//       simplePart: List<String>.from(json['simple_part']),
//       exactPart: List<String>.from(json['exact_part']),
//       thumbnail: json['thumbnail'],
//     );
//   }
// }
