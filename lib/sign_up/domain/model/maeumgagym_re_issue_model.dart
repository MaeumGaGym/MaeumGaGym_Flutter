import 'package:dio/dio.dart';

class MaeumgagymReIssueModel {
  final int statusCode;
  final String? accessToken;
  final String? refreshToken;

  MaeumgagymReIssueModel({
    required this.statusCode,
    required this.accessToken,
    required this.refreshToken,
  });

  factory MaeumgagymReIssueModel.fromJson(Headers json, int statusCode) {
    String jsonRFToken = json.map['set-cookie']![0];

    return MaeumgagymReIssueModel(
      accessToken: json.value('authorization').toString(),
      refreshToken: jsonRFToken.substring(9, jsonRFToken.indexOf(';')),
      statusCode: statusCode,
    );
  }
}
