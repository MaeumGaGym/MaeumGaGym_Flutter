import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MaeumgagymReIssueModel {
  final AsyncValue<int> stateus;
  final String? accessToken;
  final String? refreshToken;

  MaeumgagymReIssueModel({
    required this.stateus,
    required this.accessToken,
    required this.refreshToken,
  });

  factory MaeumgagymReIssueModel.fromJson(Headers json, int statusCode) {
    String jsonRFToken = json.map['set-cookie']![0];

    return MaeumgagymReIssueModel(
      accessToken: json.value('authorization').toString(),
      refreshToken: jsonRFToken.substring(9, jsonRFToken.indexOf(';')),
      stateus: AsyncData(statusCode),
    );
  }

  MaeumgagymReIssueModel copyWith({
    final AsyncValue<int>? stateus,
    final String? accessToken,
    final String? refreshToken,
  }) =>
      MaeumgagymReIssueModel(
        stateus: stateus ?? this.stateus,
        accessToken: accessToken ?? this.accessToken,
        refreshToken: refreshToken ?? this.refreshToken,
      );
}
