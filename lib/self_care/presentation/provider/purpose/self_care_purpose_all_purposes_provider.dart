import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maeum_ga_gym_flutter/core/di/token_secure_storage_di.dart';
import 'package:maeum_ga_gym_flutter/self_care/data/repositoryImpl/purpose_repository_impl.dart';
import 'package:maeum_ga_gym_flutter/self_care/domain/model/purpose/purpose_list_response_model.dart';
import 'package:maeum_ga_gym_flutter/self_care/domain/usecase/purpose_usecase.dart';

final selfCarePurposeAllPurposesProvider = StateNotifierProvider<SelfCarePurposeAllPurposesStateNotifier, PurposeListResponseModel>((ref) => SelfCarePurposeAllPurposesStateNotifier());

class SelfCarePurposeAllPurposesStateNotifier
    extends StateNotifier<PurposeListResponseModel> {
  SelfCarePurposeAllPurposesStateNotifier()
      : super(
          PurposeListResponseModel(
            statusCode: const AsyncData(500),
            purposeList: [],
          ),
        );

  final PurposeUseCase _purposeUseCase =
      PurposeUseCase(PurposeRepositoryImpl());

  String? accessToken;

  Future<void> getAllPurpose({required int index}) async {
    try {
      state = state.copyWith(statusCode: const AsyncLoading());
      accessToken = await TokenSecureStorageDi.readLoginAccessToken();

      final response = await _purposeUseCase.getAllPurpose(
        accessToken: accessToken!,
        index: index,
      );

      state = state.copyWith(
        statusCode: response.statusCode,
        purposeList: response.purposeList,
      );
    } catch (err) {
      throw Exception(err.toString());
    }
  }
}
