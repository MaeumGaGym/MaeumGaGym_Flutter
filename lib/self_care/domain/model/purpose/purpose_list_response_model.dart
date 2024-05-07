import 'package:flutter_riverpod/flutter_riverpod.dart';

class PurposeListResponseModel {
  final AsyncValue<int> statusCode;
  List<PurposeListResponseModel> purposeList = [];

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
          .map((routineJson) =>
              PurposeListResponseModel.fromJson(routineJson, statusCode))
          .toList(),
    );
  }
}
