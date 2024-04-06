import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maeum_ga_gym_flutter/self_care/domain/model/routine_pose_model.dart';

class ExerciseInfoResponseModel {
  final AsyncValue<int> statusCode;
  RoutinePoseModel? pose;
  final int? repetitions;
  final int? sets;

  ExerciseInfoResponseModel({
    required this.statusCode,
    required this.pose,
    required this.repetitions,
    required this.sets,
  });

  factory ExerciseInfoResponseModel.fromJson(
    Map<String, dynamic> json,
    int statusCode,
  ) {
    return ExerciseInfoResponseModel(
      statusCode: AsyncData(statusCode),
      pose: RoutinePoseModel.fromJson(json['pose']),
      repetitions: json['repetitions'],
      sets: json['sets'],
    );
  }
}
