import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maeum_ga_gym_flutter/core/di/dio_di.dart';
import 'package:maeum_ga_gym_flutter/self_care/domain/model/purpose/purpose_list_response_model.dart';
import 'package:maeum_ga_gym_flutter/self_care/domain/model/purpose/purpose_response_model.dart';

class PurposeRemoteDataSource {
  Future<AsyncValue<int?>> createPurpose({
    required String accessToken,
    required String title,
    required String content,
    required String startDate,
    required String endDate,
  }) async {
    Map<String, dynamic> data = {
      "title": title,
      "content": content,
      "start_date": startDate,
      "end_date": endDate,
    };

    try {
      return await dio
          .post(
        "/purposes",
        data: data,
        options: Options(
          headers: {
            "Content-Type": "application/json",
            "Authorization": accessToken,
          },
        ),
      )
          .then((response) {
        return AsyncData(response.statusCode);
      });
    } catch (err) {
      return AsyncError(err, StackTrace.empty);
    }
  }

  Future<PurposeListResponseModel> getMyPurpose({
    required String accessToken,
    required int index,
  }) async {
    try {
      return await dio
          .get(
        "/purposes/my",
        queryParameters: {
          "index": index,
        },
        options: Options(
          headers: {
            "Content-Type": "application/json",
            "Authorization": accessToken,
          },
        ),
      )
          .then((response) {
        return PurposeListResponseModel.fromJson(
          response.data,
          response.statusCode!,
        );
      });
    } catch (err) {
      return PurposeListResponseModel(
        statusCode: AsyncError(err, StackTrace.empty),
        purposeList: [],
      );
    }
  }

  Future<PurposeListResponseModel> getMonthPurpose({
    required String accessToken,
    required String date,
  }) async {
    try {
      return await dio
          .get(
        "/purposes/month/$date",
        options: Options(
          headers: {
            "Content-Type": "application/json",
            "Authorization": accessToken,
          },
        ),
      )
          .then((response) {
        return PurposeListResponseModel.fromJson(
          response.data,
          response.statusCode!,
        );
      });
    } catch (err) {
      return PurposeListResponseModel(
        statusCode: AsyncError(err, StackTrace.empty),
        purposeList: [],
      );
    }
  }

  Future<PurposeResponseModel> getDetailPurpose({
    required String accessToken,
    required int purposeId,
  }) async {
    try {
      return await dio.get(
        "/purposes/$purposeId",
        options: Options(
          headers: {
            "Content-Type": "application/json",
            "Authorization": accessToken,
          },
        ),
      )
          .then((response) {
        return PurposeResponseModel.fromJson(
          response.data,
          response.statusCode!,
        );
      });
    } catch (err) {
      return PurposeResponseModel(
        statusCode: AsyncError(err, StackTrace.empty),
        id: null,
        title: null,
        content: null,
        startDate: null,
        endDate: null,
      );
    }
  }

  Future<AsyncValue<int?>> editPurpose({
    required String accessToken,
    required int purposeId,
    required String title,
    required String content,
    required String startDate,
    required String endDate,
  }) async {
    Map<String, dynamic> data = {
      "title": title,
      "content": content,
      "start_date": startDate,
      "end_date": endDate,
    };
    try {
      return await dio
          .put(
        "/purposes/$purposeId",
        data: data,
        options: Options(
          headers: {
            "Content-Type": "application/json",
            "Authorization": accessToken,
          },
        ),
      )
          .then((response) {
        return AsyncData(response.statusCode);
      });
    } catch (err) {
      return AsyncError(err, StackTrace.empty);
    }
  }

  Future<AsyncValue<int?>> deletePurpose({
    required String accessToken,
    required int purposeId,
  }) async {
    try {
      return await dio
          .delete(
        "/purposes/$purposeId",
        options: Options(
          headers: {
            "Content-Type": "application/json",
            "Authorization": accessToken,
          },
        ),
      )
          .then((response) {
        return AsyncData(response.statusCode);
      });
    } catch (err) {
      return AsyncError(err, StackTrace.empty);
    }
  }
}
