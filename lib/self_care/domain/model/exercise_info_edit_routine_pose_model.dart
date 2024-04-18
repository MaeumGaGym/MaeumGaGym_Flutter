import 'package:flutter/material.dart';
import 'package:maeum_ga_gym_flutter/core/component/pose/domain/model/pose_data_model.dart';

class ExerciseInfoEditRoutinePoseModel {
  PoseDataModel? poseModel;
  final TextEditingController repetitionsController;
  final TextEditingController setsController;

  ExerciseInfoEditRoutinePoseModel({
    required this.poseModel,
    required this.repetitionsController,
    required this.setsController,
  });
}
