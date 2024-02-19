import 'package:dio/dio.dart';

class CSRFTokenModel {
  final String xsrfToken;

  CSRFTokenModel({required this.xsrfToken});

  factory CSRFTokenModel.fromJson(Headers json) {
    String jsonXSRFToken = json.map['set-cookie']![0];

    return CSRFTokenModel(
      xsrfToken: jsonXSRFToken.substring(
        jsonXSRFToken.indexOf('=') + 1,
        jsonXSRFToken.indexOf(';'),
      ),
    );
  }
}
