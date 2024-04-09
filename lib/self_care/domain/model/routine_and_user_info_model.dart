import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maeum_ga_gym_flutter/self_care/domain/model/routine_response_model.dart';
import 'package:maeum_ga_gym_flutter/self_care/domain/model/user_info_model.dart';

class RoutineAndUserInfoModel {
  final AsyncValue<int> statusCode;
  final UserInfoModel? userInfo;
  List<RoutineResponseModel> routineList = [];

  RoutineAndUserInfoModel({
    required this.statusCode,
    required this.userInfo,
    required this.routineList,
  });

  factory RoutineAndUserInfoModel.fromJson(
      Map<String, dynamic> json,
      int statusCode,
      ) {
    return RoutineAndUserInfoModel(
      statusCode: AsyncData(statusCode),
      userInfo: UserInfoModel.fromJson(json['user_info']),
      routineList: (json['routine_list'] as List)
          .map((routineJson) => RoutineResponseModel.fromJson(routineJson, statusCode))
          .toList(),
    );
  }

  RoutineAndUserInfoModel copyWith({
    AsyncValue<int>? statusCode,
    UserInfoModel? userInfo,
    List<RoutineResponseModel>? routineList,
  }) {
    return RoutineAndUserInfoModel(
      statusCode: statusCode ?? this.statusCode,
      userInfo: userInfo ?? this.userInfo,
      routineList: routineList ?? this.routineList,
    );
  }
}
