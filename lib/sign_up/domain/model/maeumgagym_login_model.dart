import 'package:dio/dio.dart';

class MaeumgagymLoginModel {
  final int statusCode;
  final String accessToken;
  final String refreshToken;
  final String xsrfToken;

  MaeumgagymLoginModel({
    required this.statusCode,
    required this.accessToken,
    required this.refreshToken,
    required this.xsrfToken,
  });

  factory MaeumgagymLoginModel.fromJson(Headers json, int statusCode) {
    return MaeumgagymLoginModel(
      accessToken: json.value('authorization').toString(),
      refreshToken: json.map['set-cookie']![0],
      xsrfToken: json.map['set-cookie']![1],
      statusCode: statusCode,
    );
  }
}
