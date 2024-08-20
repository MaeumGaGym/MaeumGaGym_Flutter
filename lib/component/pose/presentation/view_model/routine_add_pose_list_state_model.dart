import 'package:flutter/cupertino.dart';
import 'package:maeumgagym_flutter/core/pose_model/pose_entity.dart';

class RoutineAddPoseListStateModel {
  PoseEntity poseData;
  /// 포즈 repetitions의 값을 관리하는 컨트롤러
  final TextEditingController repetitionsController;
  final FocusNode repetitionsNode;
  /// 포즈 sets의 값을 관리하는 컨트롤러
  final TextEditingController setsController;
  final FocusNode setsNode;


  RoutineAddPoseListStateModel({
    required this.poseData,
    required this.repetitionsController,
    required this.repetitionsNode,
    required this.setsController,
    required this.setsNode,
  });
}