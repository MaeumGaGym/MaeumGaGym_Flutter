import 'package:dio/dio.dart';

class MaeumgagymSignUpModel {
  final String xsrfToken;
  final int statusCode;

  MaeumgagymSignUpModel({required this.xsrfToken, required this.statusCode});

  factory MaeumgagymSignUpModel.fromJson(Headers json, int statusCode) {
    String jsonXSRFToken = json.map['set-cookie']![0];
    return MaeumgagymSignUpModel(
      xsrfToken: jsonXSRFToken.substring(
          jsonXSRFToken.indexOf('=') + 1, jsonXSRFToken.indexOf(';')),
      statusCode: statusCode,
    );
  }
}
