import 'package:flutter_riverpod/flutter_riverpod.dart';

class PoseDetailModel {
  final String? simpleName, exactName, thumbnail;
  final List<String>? poseImage;
  final List<String>? simplePart;
  final List<String>? exactPart;
  final List<String>? startPose;
  final List<String>? exerciseWay;
  final List<String>? breatheWay;
  final List<String>? caution;
  final AsyncValue<int> statusCode;

  PoseDetailModel({
    required this.simpleName,
    required this.exactName,
    required this.thumbnail,
    required this.poseImage,
    required this.simplePart,
    required this.exactPart,
    required this.startPose,
    required this.exerciseWay,
    required this.breatheWay,
    required this.caution,
    required this.statusCode,
  });

  factory PoseDetailModel.fromJson(Map<String, dynamic> json, int? statusCode) {
    return PoseDetailModel(
      simpleName: json['simple_name'],
      exactName: json['exact_name'],
      thumbnail: json['thumbnail'],
      poseImage: List<String>.from(json['pose_images']),
      simplePart: List<String>.from(json['simple_part']),
      exactPart: List<String>.from(json['exact_part']),
      startPose: List<String>.from(json['start_pose']),
      exerciseWay: List<String>.from(json['exercise_way']),
      breatheWay: List<String>.from(json['breathe_way']),
      caution: List<String>.from(json['caution']),
      statusCode: AsyncData(statusCode!),
    );
  }

  PoseDetailModel copyWith({
    String? simpleName,
    String? exactName,
    String? thumbnail,
    List<String>? poseImage,
    List<String>? simplePart,
    List<String>? exactPart,
    List<String>? startPose,
    List<String>? exerciseWay,
    List<String>? breatheWay,
    List<String>? caution,
    AsyncValue<int>? statusCode,
  }) {
    return PoseDetailModel(
      simpleName: simpleName ?? this.simpleName,
      exactName: exactName ?? this.exactName,
      thumbnail: thumbnail ?? this.thumbnail,
      poseImage: poseImage ?? this.poseImage,
      simplePart: simplePart ?? this.simplePart,
      exactPart: exactPart ?? this.exactPart,
      startPose: startPose ?? this.startPose,
      exerciseWay: exerciseWay ?? this.exerciseWay,
      breatheWay: breatheWay ?? this.breatheWay,
      caution: caution ?? this.caution,
      statusCode: statusCode ?? this.statusCode,
    );
  }
}
