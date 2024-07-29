import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maeum_ga_gym_flutter/core/component/pose/domain/model/pose_data_model.dart';

class PoseRecommendListModel {
  final List<PoseRecommendModel> responses;
  AsyncValue<int> statusCode;

  PoseRecommendListModel({
    required this.responses,
    required this.statusCode,
  });

  factory PoseRecommendListModel.fromJson(Map<String, dynamic> json, int? statusCode){
    return PoseRecommendListModel(
      responses: json["responses"].map<PoseRecommendModel>((item) => PoseRecommendModel.fromJson(item)).toList(),
      statusCode: AsyncData(statusCode!),
    );
  }
}

class PoseRecommendModel {
  final String category;
  final List<PoseDataModel> poses;

  PoseRecommendModel({
    required this.category,
    required this.poses,
  });

  factory PoseRecommendModel.fromJson(Map<String, dynamic> response){
    return PoseRecommendModel(
      category: response['category'],
      poses: response['poses'].map<PoseDataModel>((item) => PoseDataModel.fromJson(item)).toList(),
    );
  }
}

