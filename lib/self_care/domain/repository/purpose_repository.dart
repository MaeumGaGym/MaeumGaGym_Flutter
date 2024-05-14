import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maeum_ga_gym_flutter/self_care/domain/model/purpose/purpose_list_response_model.dart';
import 'package:maeum_ga_gym_flutter/self_care/domain/model/purpose/purpose_response_model.dart';

abstract class PurposeRepository {
  Future<AsyncValue<int?>> createPurpose({
    required String accessToken,
    required String title,
    required String content,
    required String startDate,
    required String endDate,
  });

  Future<PurposeListResponseModel> getAllPurpose({
    required String accessToken,
    required int index,
  });

  Future<PurposeListResponseModel> getMonthPurpose({
    required String accessToken,
    required String date,
  });

  Future<PurposeResponseModel> getPurpose({
    required String accessToken,
    required String purposeId,
  });

  Future<AsyncValue<int?>> editPurpose({
    required String accessToken,
    required int purposeId,
    required String title,
    required String content,
    required String startDate,
    required String endDate,
  });

  Future<AsyncValue<int?>> deletePurpose({
    required String accessToken,
    required String purposeId,
  });
}