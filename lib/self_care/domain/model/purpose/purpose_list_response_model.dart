import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maeum_ga_gym_flutter/self_care/domain/model/purpose/purpose_base_model.dart';

class PurposeListResponseModel {
  final AsyncValue<int> statusCode;
  List<PurposeBaseModel> purposeList = [];

  PurposeListResponseModel({
    required this.statusCode,
    required this.purposeList,
  });

  factory PurposeListResponseModel.fromJson(
    Map<String, dynamic> json,
    int statusCode,
  ) {
    return PurposeListResponseModel(
      statusCode: AsyncData(statusCode),
      purposeList: (json['purpose_list'] as List)
          .map((routineJson) => PurposeBaseModel.fromJson(routineJson))
          .toList(),
    );
  }

  PurposeListResponseModel copyWith({
    AsyncValue<int>? statusCode,
    List<PurposeBaseModel>? purposeList,
  }) {
    return PurposeListResponseModel(
      statusCode: statusCode ?? this.statusCode,
      purposeList: purposeList ?? this.purposeList,
    );
  }
}
