import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maeum_ga_gym_flutter/core/di/token_secure_storage_di.dart';
import 'package:maeum_ga_gym_flutter/core/component/routine/data/repositoryImpl/routine_repository_impl.dart';
import 'package:maeum_ga_gym_flutter/core/component/routine/domain/model/routine_and_user_info_model.dart';
import 'package:maeum_ga_gym_flutter/core/component/routine/domain/usecase/routine_usecase.dart';

final routineMyRoutinesProvider = StateNotifierProvider<
    RoutineMyRoutinesStateNotifier, RoutineAndUserInfoModel>((ref) {
  return RoutineMyRoutinesStateNotifier();
});

class RoutineMyRoutinesStateNotifier
    extends StateNotifier<RoutineAndUserInfoModel> {
  RoutineMyRoutinesStateNotifier()
      : super(RoutineAndUserInfoModel(
          statusCode: const AsyncData(500),
          userInfo: null,
          routineList: [],
        ));

  final RoutineUseCase _routineUseCase =
      RoutineUseCase(RoutineRepositoryImpl());

  String? accessToken;

  Future<void> getMyRoutineInit() async {
    try {
      state = state.copyWith(statusCode: const AsyncLoading());
      accessToken = await TokenSecureStorageDi.readLoginAccessToken();

      final response = await _routineUseCase.getMyRoutine(
        accessToken: accessToken!,
        index: 0,
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

  Future<void> getMyRoutine({required int index}) async {
    try {
      state = state.copyWith(statusCode: const AsyncLoading());
      accessToken = await TokenSecureStorageDi.readLoginAccessToken();

      final response = await _routineUseCase.getMyRoutine(
        accessToken: accessToken!,
        index: index,
      );

      state.routineList += response.routineList;
      state = state.copyWith(statusCode: response.statusCode);
    } catch (err) {
      throw Exception(err.toString());
    }
  }

  Future<void> changeRoutineState({required int index, required bool? isArchived, required bool? isShared}) async {
    state.routineList[index].routineStatus = state.routineList[index].routineStatus.copyWith(isArchived: isArchived, isShared: isShared);
  }
}
