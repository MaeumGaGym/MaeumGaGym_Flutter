import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maeum_ga_gym_flutter/core/di/token_secure_storage_di.dart';
import 'package:maeum_ga_gym_flutter/self_care/data/repositoryImpl/purpose_repository_impl.dart';
import 'package:maeum_ga_gym_flutter/self_care/domain/model/purpose/purpose_response_model.dart';
import 'package:maeum_ga_gym_flutter/self_care/domain/usecase/purpose_usecase.dart';

final selfCarePurposeDetailPurposesProvider = StateNotifierProvider<
        SelfCarePurposeDetailPurposesStateNotifier, PurposeResponseModel>(
    (ref) => SelfCarePurposeDetailPurposesStateNotifier());

class SelfCarePurposeDetailPurposesStateNotifier
    extends StateNotifier<PurposeResponseModel> {
  SelfCarePurposeDetailPurposesStateNotifier()
      : super(
          PurposeResponseModel(
            statusCode: const AsyncData(500),
            id: null,
            title: null,
            content: null,
            startDate: null,
            endDate: null,
          ),
        );

  final PurposeUseCase _purposeUseCase =
      PurposeUseCase(PurposeRepositoryImpl());

  String? accessToken;

  Future<void> getDetailPurpose({
    required int purposeId,
  }) async {
    try {
      state = state.copyWith(statusCode: const AsyncLoading());
      accessToken = await TokenSecureStorageDi.readLoginAccessToken();

      final response = await _purposeUseCase.getDetailPurpose(
        accessToken: accessToken!,
        purposeId: purposeId,
      );

      state = response;
    } catch (err) {
      throw Exception(err.toString());
    }
  }
}
