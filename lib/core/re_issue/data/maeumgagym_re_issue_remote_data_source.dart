import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maeum_ga_gym_flutter/core/di/dio_di.dart';

import '../domain/maeumgagym_re_issue_model.dart';

class MaeumgagymReIssueRemoteDataSource {
  Future<MaeumgagymReIssueModel> getReIssue(String refreshToken) async {
    Map<String, String> header = {"RF-TOKEN": refreshToken};

    try {
      return await dio
          .get(
        '/auth/re-issue',
        options: Options(headers: header),
      )
          .then((response) {
        return MaeumgagymReIssueModel.fromJson(
          response.headers,
          response.statusCode ?? 0,
        );
      });
    } catch (err) {
      return MaeumgagymReIssueModel(
        stateus: AsyncError(err, StackTrace.empty),
        accessToken: null,
        refreshToken: null,
      );
    }
  }
}
