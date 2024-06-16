import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maeum_ga_gym_flutter/core/component/pose/domain/model/pose_data_model.dart';

class PoseRecommendModel {
  Map<String, List<PoseDataModel>>? poses;
  AsyncValue<int> statusCode;

  PoseRecommendModel({
    required this.poses,
    required this.statusCode,
  });

  factory PoseRecommendModel.fromJson(
      Map<String, dynamic> json, int? statusCode) {
    final Map<String, List<PoseDataModel>> posesMap = {};
    json['poses'].forEach((key, value) {
      posesMap[key] = value['responses']
          .map<PoseDataModel>((item) => PoseDataModel.fromJson(item))
          .toList();
    });

    return PoseRecommendModel(
      poses: posesMap,
      statusCode: AsyncData(statusCode!),
    );
  }
}
