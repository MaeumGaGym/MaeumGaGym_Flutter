import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MaeumgagymLoginModel {
  AsyncValue<int> statusCode;
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

  MaeumgagymLoginModel copyWith({
    AsyncValue<int>? statusCode,
    final String? accessToken,
    final String? refreshToken,
  }) {
    return MaeumgagymLoginModel(
      statusCode: statusCode ?? this.statusCode,
      accessToken: accessToken ?? accessToken,
      refreshToken: refreshToken ?? refreshToken,
    );
  }
}
