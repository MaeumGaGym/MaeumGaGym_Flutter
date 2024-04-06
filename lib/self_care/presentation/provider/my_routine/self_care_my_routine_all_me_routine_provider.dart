import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maeum_ga_gym_flutter/core/di/login_option_di.dart';
import 'package:maeum_ga_gym_flutter/core/di/token_secure_storage_di.dart';
import 'package:maeum_ga_gym_flutter/self_care/data/repositoryImpl/routine_repository_impl.dart';
import 'package:maeum_ga_gym_flutter/self_care/domain/model/routine_response_model.dart';
import 'package:maeum_ga_gym_flutter/self_care/domain/model/user_info_model.dart';
import 'package:maeum_ga_gym_flutter/self_care/domain/usecase/routine_usecase.dart';

final selfCareMyRoutineAllMeRoutineProvider = StateNotifierProvider.autoDispose<
    SelfCareMyRoutineAllMeRoutineStateNotifier, RoutineAllMeState>((ref) {
  return SelfCareMyRoutineAllMeRoutineStateNotifier();
});

class SelfCareMyRoutineAllMeRoutineStateNotifier
    extends StateNotifier<RoutineAllMeState> {
  SelfCareMyRoutineAllMeRoutineStateNotifier()
      : super(RoutineAllMeState(
          statusCode: const AsyncData(500),
          userInfo: null,
          routineList: [],
        ));

  final RoutineUseCase _routineUseCase =
      RoutineUseCase(RoutineRepositoryImpl());

  String? accessToken;

  Future<void> getRoutineAllMe() async {
    try {
      state = state.copyWith(statusCode: const AsyncLoading());
      accessToken = await TokenSecureStorageDi.readLoginAccessToken();
      final response = await _routineUseCase.getRoutineAllMe(
        accessToken: accessToken!,
      );
      state = state.copyWith(
        statusCode: response.statusCode,
        userInfo: response.userInfo,
        routineList: response.routineList,
      );
    } catch (err) {
      throw Exception(err.toString());
    }
  }
}

class RoutineAllMeState {
  final AsyncValue<int> statusCode;
  final UserInfoModel? userInfo;
  List<RoutineResponseModel> routineList = [];

  RoutineAllMeState({
    required this.statusCode,
    required this.userInfo,
    required this.routineList,
  });

  RoutineAllMeState copyWith({
    AsyncValue<int>? statusCode,
    UserInfoModel? userInfo,
    List<RoutineResponseModel>? routineList,
  }) {
    return RoutineAllMeState(
      statusCode: statusCode ?? this.statusCode,
      userInfo: userInfo ?? this.userInfo,
      routineList: routineList ?? this.routineList,
    );
  }
}
