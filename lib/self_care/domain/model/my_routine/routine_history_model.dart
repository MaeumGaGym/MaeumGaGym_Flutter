import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/model/routine/maeumgagym_routine_list_model.dart';

class RoutineHistoryModel {
  final AsyncValue<int> statusCode;
  final int? id;
  final String? routineName;
  List<ExerciseInfoList> exerciseInfoList = [];
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
      exerciseInfoList: json['exercise_info_response_list']
          .map<ExerciseInfoList>((item) => ExerciseInfoList.fromJson(item))
          .toList(),
      date: json['date'],
    );
  }
}
