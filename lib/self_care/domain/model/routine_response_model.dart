import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maeum_ga_gym_flutter/self_care/domain/model/exercise_info_model.dart';
import 'package:maeum_ga_gym_flutter/self_care/domain/model/routine_status_model.dart';

class RoutineResponseModel {
  final AsyncValue<int> statusCode;
  final int? id;
  final String? routineName;
  final List<ExerciseInfoModel>? exerciseInfoList;
  final List<String>? dayOfWeeks;
  RoutineStatusModel? routineStatus;

  RoutineResponseModel({
    required this.statusCode,
    required this.id,
    required this.routineName,
    required this.exerciseInfoList,
    required this.dayOfWeeks,
    required this.routineStatus,
  });

  factory RoutineResponseModel.fromJson(
      Map<String, dynamic> json, int statusCode) {
    return RoutineResponseModel(
      statusCode: AsyncData(statusCode),
      id: json['id'],
      routineName: json['routine_name'],
      exerciseInfoList:
          List<ExerciseInfoModel>.from(json['exercise_info_list']),
      dayOfWeeks: List<String>.from(json['day_of_weeks']),
      routineStatus: RoutineStatusModel.fromJson(json['routine_status']),
    );
  }
}
