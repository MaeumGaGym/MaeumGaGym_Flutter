import 'package:dio/dio.dart';
import 'package:maeum_ga_gym_flutter/core/base_url.dart';
import 'package:maeum_ga_gym_flutter/core/custom_interceptor.dart';

final Dio dio = Dio(BaseOptions(baseUrl: baseUrl));

void addInterceptor() => dio.interceptors.add(CustomInterceptor());
