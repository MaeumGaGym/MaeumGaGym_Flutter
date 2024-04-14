import 'package:maeum_ga_gym_flutter/core/component/pose/domain/model/pose_data_model.dart';

class PoseDataListModel {
  final List<PoseDataModel>? response;

  PoseDataListModel({
    required this.response,
  });

  factory PoseDataListModel.fromJson(Map<String, dynamic> json) {
    return PoseDataListModel(
      response: json['responses']
          .map<PoseDataModel>((item) => PoseDataModel.fromJson(item))
          .toList(),
    );
  }
}
