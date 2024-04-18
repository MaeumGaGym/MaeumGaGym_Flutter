import 'package:flutter/material.dart';
import 'package:maeum_ga_gym_flutter/core/component/pose/domain/model/pose_data_model.dart';

/// 루틴 수정 페이지에서 사용되는 모델
/// 포즈마다 모델을 가짐
class ExerciseInfoEditRoutinePoseModel {
  PoseDataModel? poseModel;
  final TextEditingController repetitionsController;
  /// 포즈 repetitions의 값을 관리하는 컨트롤러
  final TextEditingController setsController;
  /// 포즈 sets의 값을 관리하는 컨트롤러

  ExerciseInfoEditRoutinePoseModel({
    required this.poseModel,
    required this.repetitionsController,
    required this.setsController,
  });
}
