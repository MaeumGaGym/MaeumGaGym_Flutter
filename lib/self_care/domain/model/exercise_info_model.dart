import 'package:flutter_riverpod/flutter_riverpod.dart';

class ExerciseInfoModel {
  final AsyncValue<int> statusCode;
  final String? exerciseName;
  final int? repetitions;
  final int? sets;

  ExerciseInfoModel({
    required this.statusCode,
    required this.exerciseName,
    required this.repetitions,
    required this.sets,
  });

  factory ExerciseInfoModel.fromJson(Map<String, dynamic> json, int statusCode) {
    return ExerciseInfoModel(
      statusCode: AsyncData(statusCode),
      exerciseName: json['exercise_name'],
      repetitions: json['repetitions'],
      sets: json['sets'],
    );
  }
}
