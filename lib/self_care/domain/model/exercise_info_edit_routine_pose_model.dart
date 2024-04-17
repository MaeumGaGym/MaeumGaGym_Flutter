import 'package:flutter/material.dart';
import 'package:maeum_ga_gym_flutter/self_care/domain/model/exercise_info_response_model.dart';

class ExerciseInfoEditRoutinePoseModel {
  ExerciseInfoResponseModel? poseModel;
  final TextEditingController repetitionsController;
  final TextEditingController setsController;

  ExerciseInfoEditRoutinePoseModel({
    required this.poseModel,
    required this.repetitionsController,
    required this.setsController,
  });
}
