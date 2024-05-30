import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maeum_ga_gym_flutter/core/di/token_secure_storage_di.dart';
import 'package:maeum_ga_gym_flutter/self_care/data/repositoryImpl/purpose_repository_impl.dart';
import 'package:maeum_ga_gym_flutter/self_care/domain/usecase/purpose_usecase.dart';

final selfCarePurposeDeletePurposesProvider = StateNotifierProvider<SelfCarePurposeDeletePurposesStateNotifier, AsyncValue<int?>>((ref) => SelfCarePurposeDeletePurposesStateNotifier());

class SelfCarePurposeDeletePurposesStateNotifier
    extends StateNotifier<AsyncValue<int?>> {
  SelfCarePurposeDeletePurposesStateNotifier() : super(const AsyncData(500));

  final PurposeUseCase _purposeUseCase =
      PurposeUseCase(PurposeRepositoryImpl());

  String? accessToken;

  Future<void> deletePurpose({
    required int purposeId,
  }) async {
    try {
      state = const AsyncLoading();
      accessToken = await TokenSecureStorageDi.readLoginAccessToken();

      final response = await _purposeUseCase.deletePurpose(
        accessToken: accessToken!,
        purposeId: purposeId,
      );

      state = response;
    } catch (err) {
      throw Exception(err.toString());
    }
  }
}
