import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maeum_ga_gym_flutter/self_care/domain/model/purpose/purpose_list_response_model.dart';
import 'package:maeum_ga_gym_flutter/self_care/domain/model/purpose/purpose_response_model.dart';
import 'package:maeum_ga_gym_flutter/self_care/domain/repository/purpose_repository.dart';

class PurposeUseCase {
  final PurposeRepository _repository;

  PurposeUseCase(this._repository);

  Future<AsyncValue<int?>> createPurpose({
    required String accessToken,
    required String title,
    required String content,
    required String startDate,
    required String endDate,
  }) async {
    return await _repository.createPurpose(
      accessToken: accessToken,
      title: title,
      content: content,
      startDate: startDate,
      endDate: endDate,
    );
  }

  Future<AsyncValue<int?>> deletePurpose({
    required String accessToken,
    required int purposeId,
  }) async {
    return await _repository.deletePurpose(
      accessToken: accessToken,
      purposeId: purposeId,
    );
  }

  Future<AsyncValue<int?>> editPurpose({
    required String accessToken,
    required int purposeId,
    required String title,
    required String content,
    required String startDate,
    required String endDate,
  }) async {
    return await _repository.editPurpose(
      accessToken: accessToken,
      purposeId: purposeId,
      title: title,
      content: content,
      startDate: startDate,
      endDate: endDate,
    );
  }

  Future<PurposeListResponseModel> getMyPurpose({
    required String accessToken,
    required int index,
  }) async {
    return await _repository.getMyPurpose(
      accessToken: accessToken,
      index: index,
    );
  }

  Future<PurposeListResponseModel> getMonthPurpose({
    required String accessToken,
    required String date,
  }) async {
    return await _repository.getMonthPurpose(
      accessToken: accessToken,
      date: date,
    );
  }

  Future<PurposeResponseModel> getDetailPurpose({
    required String accessToken,
    required int purposeId,
  }) async {
    return await _repository.getDetailPurpose(
      accessToken: accessToken,
      purposeId: purposeId,
    );
  }
}