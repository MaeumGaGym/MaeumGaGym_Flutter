import 'package:flutter_riverpod/flutter_riverpod.dart';

class PoseRecommendModel {
  Map<String, List<PoseData>>? poses;
  AsyncValue<int> statusCode;

  PoseRecommendModel({
    required this.poses,
    required this.statusCode,
  });

  factory PoseRecommendModel.fromJson(
      Map<String, dynamic> json, int? statusCode) {
    final Map<String, List<PoseData>> posesMap = {};
    json['poses'].forEach((key, value) {
      posesMap[key] = value['responses']
          .map<PoseData>((item) => PoseData.fromJson(item))
          .toList();
    });

    return PoseRecommendModel(
      poses: posesMap,
      statusCode: AsyncData(statusCode!),
    );
  }
}

class PoseData {
  int id;
  bool needMachine;
  String name;
  List<String> simplePart;
  List<String> exactPart;
  String thumbnail;

  PoseData({
    required this.id,
    required this.needMachine,
    required this.name,
    required this.simplePart,
    required this.exactPart,
    required this.thumbnail,
  });

  factory PoseData.fromJson(Map<String, dynamic> json) {
    return PoseData(
      id: json['id'],
      needMachine: json['need_machine'],
      name: json['name'],
      simplePart: List<String>.from(json['simple_part']),
      exactPart: List<String>.from(json['exact_part']),
      thumbnail: json['thumbnail'],
    );
  }
}
