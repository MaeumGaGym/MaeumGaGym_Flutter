import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maeum_ga_gym_flutter/core/di/dio_di.dart';

class MaeumgagymSignUpRemoteDataSource {
  Future<AsyncValue<int?>> googleSignUp(String googleToken, String name) async {
    debugPrint('googleToken : $googleToken');
    debugPrint('name : $name');

    Map<String, String> data = {"nickname": name};

    Map<String, dynamic> header = {"OAUTH-TOKEN": googleToken};

    try {
      return await dio
          .post('/google/signup', options: Options(headers: header), data: data)
          .then((response) {
        debugPrint(response.statusCode.toString());
        return AsyncData(response.statusCode);
      });
    } catch (err) {
      return AsyncError(err, StackTrace.empty);
    }
  }

  Future<AsyncValue<int?>> kakaoSignUp(String kakaoToken, String name) async {
    Map<String, String> data = {"nickname": name};

    Map<String, dynamic> header = {"OAUTH-TOKEN": kakaoToken};

    try {
      return await dio
          .post('/kakao/signup', options: Options(headers: header), data: data)
          .then((response) {
        debugPrint(response.statusCode.toString());
        return AsyncData(response.statusCode);
      });
    } catch (err) {
      return AsyncError(err, StackTrace.empty);
    }
  }
}
