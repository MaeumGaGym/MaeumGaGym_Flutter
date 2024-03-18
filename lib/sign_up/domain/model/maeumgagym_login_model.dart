import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MaeumgagymLoginModel {
  final AsyncValue<int> statusCode;
  final String? accessToken;
  final String? refreshToken;

  MaeumgagymLoginModel({
    required this.statusCode,
    required this.accessToken,
    required this.refreshToken,
  });

  factory MaeumgagymLoginModel.fromJson(Headers json, int statusCode) {
    String jsonRFToken = json.map['set-cookie']![0];

    return MaeumgagymLoginModel(
      accessToken: json.value('authorization').toString(),
      refreshToken: jsonRFToken.substring(9, jsonRFToken.indexOf(';')),
      statusCode: AsyncData(statusCode),
    );
  }
}
