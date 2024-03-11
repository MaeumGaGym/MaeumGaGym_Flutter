import 'package:flutter/material.dart';
import 'package:maeum_ga_gym_flutter/core/di/dio_di.dart';

class NicknameCheckRemoteDataSource {
  Future<bool> checkNickname(String name) async {
    return await dio.get('/auth/nickname/$name').then((response) {
      return response.data;
    });
  }
}
