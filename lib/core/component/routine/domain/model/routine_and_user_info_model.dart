import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maeum_ga_gym_flutter/core/model/routine/maeumgagym_routine_list_model.dart';
import 'package:maeum_ga_gym_flutter/self_care/domain/model/my_routine/routine_user_info_model.dart';

class RoutineAndUserInfoModel {
  final AsyncValue<int> statusCode;
  final RoutineUserInfoModel? userInfo;
  List<RoutineModel> routineList = [];

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
      routineList: json['routine_list'].map<RoutineModel>((data) => RoutineModel.fromJson(data)).toList()
    );
  }

  RoutineAndUserInfoModel copyWith({
    AsyncValue<int>? statusCode,
    RoutineUserInfoModel? userInfo,
    List<RoutineModel>? routineList,
  }) {
    return RoutineAndUserInfoModel(
      statusCode: statusCode ?? this.statusCode,
      userInfo: userInfo ?? this.userInfo,
      routineList: routineList ?? this.routineList,
    );
  }
}
