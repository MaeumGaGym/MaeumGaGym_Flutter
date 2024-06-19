import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maeum_ga_gym_flutter/core/di/token_secure_storage_di.dart';
import 'package:maeum_ga_gym_flutter/self_care/data/repositoryImpl/purpose_repository_impl.dart';
import 'package:maeum_ga_gym_flutter/self_care/domain/usecase/purpose_usecase.dart';

final selfCarePurposeEditPurposesProvider = StateNotifierProvider<
    SelfCarePurposeEditPurposesStateNotifier, AsyncValue<int?>>(
  (ref) => SelfCarePurposeEditPurposesStateNotifier(),
);

class SelfCarePurposeEditPurposesStateNotifier
    extends StateNotifier<AsyncValue<int?>> {
  SelfCarePurposeEditPurposesStateNotifier() : super(const AsyncData(500));

  final PurposeUseCase _purposeUseCase =
      PurposeUseCase(PurposeRepositoryImpl());

  String? accessToken;

  Future<void> editPurpose({
    required int purposeId,
    required String title,
    required String content,
    required String startDate,
    required String endDate,
  }) async {
    try {
      state = const AsyncLoading();
      accessToken = await TokenSecureStorageDi.readLoginAccessToken();

      final response = await _purposeUseCase.editPurpose(
        accessToken: accessToken!,
        purposeId: purposeId,
        title: title,
        content: content,
        startDate: startDate,
        endDate: endDate,
      );
      state = response;
    } catch (err) {
      throw Exception(err.toString());
    }
  }
}
