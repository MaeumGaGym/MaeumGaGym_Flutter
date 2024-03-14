import 'package:flutter/cupertino.dart';
import 'package:maeum_ga_gym_flutter/core/di/dio_di.dart';

import '../../../domain/model/maeumgagym_re_issue_model.dart';

class MaeumgagymReIssueRemoteDataSource {
  Future<MaeumgagymReIssueModel> getReIssue(String refreshToken) async {
    Map<String, String> data = {"refresh_token": refreshToken};

    try {
      return await dio.get('/auth/re-issue', data: data).then((response) {
        debugPrint('/auth/re-issue success!');
        debugPrint(response.statusCode.toString());
        return MaeumgagymReIssueModel.fromJson(
          response.headers,
          response.statusCode ?? 401,
        );
      });
    } catch (err) {
      if (err.toString().contains('401')) {
        return MaeumgagymReIssueModel(
          statusCode: 401,
          accessToken: null,
          refreshToken: null,
        );
      } else {
        throw Exception(err);
      }
    }
  }
}
