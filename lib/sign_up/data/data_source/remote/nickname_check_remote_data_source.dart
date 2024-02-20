import 'package:dio/dio.dart';
import 'package:maeum_ga_gym_flutter/core/base_url.dart';

import 'package:flutter/material.dart';

class NicknameCheckRemoteDataSource {
  final Dio _dio = Dio(BaseOptions(baseUrl: baseUrl));

  Future<bool> checkNickname(String name) async {
    return await _dio.get('/auth/nickname/$name').then((response) {
      debugPrint("${response.data.toString()} --- $name");
      return response.data;
    });
  }
}
