import 'package:maeum_ga_gym_flutter/self_care/data/date_source/remote/purpose_remote_data_source.dart';
import 'package:maeum_ga_gym_flutter/self_care/domain/model/purpose/purpose_list_response_model.dart';
import 'package:maeum_ga_gym_flutter/self_care/domain/model/purpose/purpose_response_model.dart';
import 'package:maeum_ga_gym_flutter/self_care/domain/repository/purpose_repository.dart';
import 'package:riverpod/src/common.dart';

class PurposeRepositoryImpl implements PurposeRepository {
  final PurposeRemoteDataSource _remoteDataSource = PurposeRemoteDataSource();

  @override
  Future<AsyncValue<int?>> createPurpose({
    required String accessToken,
    required String title,
    required String content,
    required String startDate,
    required String endDate,
  }) async {
    return await _remoteDataSource.createPurpose(
      accessToken: accessToken,
      title: title,
      content: content,
      startDate: startDate,
      endDate: endDate,
    );
  }

  @override
  Future<AsyncValue<int?>> deletePurpose({
    required String accessToken,
    required String purposeId,
  }) async {
    return await _remoteDataSource.deletePurpose(
      accessToken: accessToken,
      purposeId: purposeId,
    );
  }

  @override
  Future<AsyncValue<int?>> editPurpose({
    required String accessToken,
    required int purposeId,
    required String title,
    required String content,
    required String startDate,
    required String endDate,
  }) async {
    return await _remoteDataSource.editPurpose(
      accessToken: accessToken,
      purposeId: purposeId,
      title: title,
      content: content,
      startDate: startDate,
      endDate: endDate,
    );
  }

  @override
  Future<PurposeListResponseModel> getAllPurpose({
    required String accessToken,
    required int index,
  }) async {
    return await _remoteDataSource.getAllPurpose(
      accessToken: accessToken,
      index: index,
    );
  }

  @override
  Future<PurposeListResponseModel> getMonthPurpose({
    required String accessToken,
    required String date,
  }) async {
    return await _remoteDataSource.getMonthPurpose(
      accessToken: accessToken,
      date: date,
    );
  }

  @override
  Future<PurposeResponseModel> getPurpose({
    required String accessToken,
    required String purposeId,
  }) async {
    return await _remoteDataSource.getPurpose(
      accessToken: accessToken,
      purposeId: purposeId,
    );
  }
}
