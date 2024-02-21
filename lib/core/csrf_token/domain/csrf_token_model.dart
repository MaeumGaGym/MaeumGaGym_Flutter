import 'package:dio/dio.dart';

class CSRFTokenModel {
  final int statusCode;
  final String xsrfToken;

  CSRFTokenModel({required this.statusCode, required this.xsrfToken});

  factory CSRFTokenModel.fromJson(Headers json, int statusCode) {
    String jsonXSRFToken = json.map['set-cookie']![0];

    return CSRFTokenModel(
      statusCode: statusCode,
      xsrfToken: jsonXSRFToken.substring(
        jsonXSRFToken.indexOf('=') + 1,
        jsonXSRFToken.indexOf(';'),
      ),
    );
  }
}
