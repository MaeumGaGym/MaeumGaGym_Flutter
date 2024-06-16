import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maeum_ga_gym_flutter/self_care/domain/model/my_routine/routine_response_model.dart';
import 'package:maeum_ga_gym_flutter/self_care/domain/model/my_routine/routine_user_info_model.dart';

class RoutineAndUserInfoModel {
  final AsyncValue<int> statusCode;
  final RoutineUserInfoModel? userInfo;
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
      userInfo: RoutineUserInfoModel.fromJson(json['user_info']),
      routineList: (json['routine_list'] as List)
          .map((routineJson) => RoutineResponseModel.fromJson(routineJson, statusCode))
          .toList(),
    );
  }

  RoutineAndUserInfoModel copyWith({
    AsyncValue<int>? statusCode,
    RoutineUserInfoModel? userInfo,
    List<RoutineResponseModel>? routineList,
  }) {
    return RoutineAndUserInfoModel(
      statusCode: statusCode ?? this.statusCode,
      userInfo: userInfo ?? this.userInfo,
      routineList: routineList ?? this.routineList,
    );
  }
}
