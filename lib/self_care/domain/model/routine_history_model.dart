import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maeum_ga_gym_flutter/self_care/domain/model/exercise_info_model.dart';

class RoutineHistoryModel {
  final AsyncValue<int> statusCode;
  final int? id;
  final String? routineName;
  final List<ExerciseInfoModel>? exerciseInfoList;
  final String? date;

  RoutineHistoryModel({
    required this.statusCode,
    required this.id,
    required this.routineName,
    required this.exerciseInfoList,
    required this.date,
  });

  factory RoutineHistoryModel.fromJson(
      Map<String, dynamic> json, int statusCode) {
    return RoutineHistoryModel(
      statusCode: AsyncData(statusCode),
      id: json['id'],
      routineName: json['routine_name'],
      exerciseInfoList: List<ExerciseInfoModel>.from(json['exercise_info_list']),
      date: json['date'],
    );
  }
}
