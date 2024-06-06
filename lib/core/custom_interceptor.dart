import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:maeum_ga_gym_flutter/core/di/token_secure_storage_di.dart';
import 'package:maeum_ga_gym_flutter/core/re_issue/domain/maeumgagym_re_issue_model.dart';

import 'base_url.dart';

class CustomInterceptor extends Interceptor {
  final Dio dio = Dio(BaseOptions(baseUrl: baseUrl));

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // 요청 보낼때
    debugPrint('[REQ] [${options.method}] ${options.uri}');

    return super.onRequest(options, handler);
  }

  Future<MaeumgagymReIssueModel> useReIssue(String refreshToken) async {
    Map<String, String> header = {"RF-TOKEN": refreshToken};
    final response = await dio.get(
      '/auth/re-issue',
      options: Options(headers: header),
    );

    final MaeumgagymReIssueModel reIssueResponse =
        MaeumgagymReIssueModel.fromJson(
      response.headers,
      response.statusCode!,
    );

    return reIssueResponse;
  }

  // 에러가 났을때
  @override
  void onError(err, ErrorInterceptorHandler handler) async {
    debugPrint(
      '[ERR] [${err.requestOptions.method}] ${err.requestOptions.uri}',
    );

    if (err.response?.statusCode == 401) {
      final String? refreshToken =
          await TokenSecureStorageDi.readLoginRefreshToken();

      if (refreshToken == null) {
        return handler.reject(err);
      }

      try {
        MaeumgagymReIssueModel reIssueResponse = await useReIssue(refreshToken);

        if (reIssueResponse.accessToken != null) {
          final options = err.requestOptions;

          options.headers.addAll({
            'Authorization': reIssueResponse.accessToken,
          });

          await TokenSecureStorageDi.writeLoginAccessToken(
              reIssueResponse.accessToken);
          await TokenSecureStorageDi.writeLoginRefreshToken(
              reIssueResponse.refreshToken);

          final response = await dio.fetch(options);

          return handler.resolve(response);
        }

        return handler.next(err);
      } on DioError catch (err) {
        return handler.reject(err);
      }
    }
    return handler.reject(err);
  }
}
