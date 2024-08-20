import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../core/ignore/base_url.dart';
import '../core/token_secure_storage.dart';

final Dio dio = Dio(BaseOptions(baseUrl: baseUrl));

void dioInit() => dio.interceptors.add(CustomInterceptor());

class CustomInterceptor extends Interceptor {
  final Dio dio = Dio(BaseOptions(baseUrl: baseUrl));

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // 요청 보낼때
    debugPrint('[REQ] [${options.method}] ${options.uri}');

    return super.onRequest(options, handler);
  }

  Future<MaeumgagymReIssueDto> useReIssue(String refreshToken) async {
    Map<String, String> header = {"RF-TOKEN": refreshToken};
    final response = await dio.get(
      '/auth/re-issue',
      options: Options(headers: header),
    );

    final MaeumgagymReIssueDto reIssueResponse = MaeumgagymReIssueDto.fromJson(
      response.headers,
    );

    return reIssueResponse;
  }

  // 에러가 났을때
  @override
  void onError(err, ErrorInterceptorHandler handler) async {
    debugPrint(
      '[ERR] [${err.requestOptions.method}] ${err.requestOptions.uri} \n'
          '[Error Message] ${err.message}',
    );

    if (err.response?.statusCode == 401) {
      final String? refreshToken = await TokenSecureStorage.readRefreshToken();

      if (refreshToken == null) {
        return handler.reject(err);
      }

      try {
        MaeumgagymReIssueDto reIssueResponse = await useReIssue(refreshToken);

        final options = err.requestOptions;
        options.headers.addAll({
          'Authorization': reIssueResponse.accessToken,
        });

        await TokenSecureStorage.writeAccessToken(reIssueResponse.accessToken);
        await TokenSecureStorage.writeRefreshToken(reIssueResponse.refreshToken);

        final response = await dio.fetch(options);

        return handler.resolve(response);
      } on DioException catch (err) {
        return handler.reject(err);
      }
    }
    return handler.reject(err);
  }
}

class MaeumgagymReIssueDto {
  final String accessToken;
  final String refreshToken;

  const MaeumgagymReIssueDto({
    required this.accessToken,
    required this.refreshToken,
  });

  factory MaeumgagymReIssueDto.fromJson(Headers json) {
    String jsonRFToken = json.map['set-cookie']![0];

    return MaeumgagymReIssueDto(
      accessToken: json.value('authorization').toString(),
      refreshToken: jsonRFToken.substring(9, jsonRFToken.indexOf(';')),
    );
  }
}