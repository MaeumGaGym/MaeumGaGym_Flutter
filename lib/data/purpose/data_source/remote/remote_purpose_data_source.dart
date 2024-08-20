import 'package:dio/dio.dart';
import 'package:maeumgagym_flutter/data/purpose/dto/request/add_purpsoe_request.dart';
import 'package:maeumgagym_flutter/data/purpose/dto/response/purpose_dto.dart';
import 'package:maeumgagym_flutter/data/purpose/dto/response/purposes_dto.dart';
import 'package:maeumgagym_flutter/domain/purposes/entity/purpose_entity.dart';
import 'package:maeumgagym_flutter/domain/purposes/entity/purposes_entity.dart';

import '../../../../core/token_secure_storage.dart';
import '../../../../init/dio_init.dart';

class RemotePurposeDataSource {
  Future<PurposesEntity> getPurposes({required int index}) async {
    final accessToken = await TokenSecureStorage.readAccessToken();
    Map<String, dynamic> headers = {'Authorization': accessToken};

    try {
      final response = await dio.get("/purposes/my",
        queryParameters: {"index" : index},
        options: Options(headers: headers),
      );

      return PurposesDto.fromJson(response.data).toEntity();
    } catch (err) {
      throw Exception(err);
    }
  }

  Future<PurposeEntity> getPurposeDetail({required int purposeId}) async {
    final accessToken = await TokenSecureStorage.readAccessToken();
    Map<String, dynamic> headers = {'Authorization': accessToken};

    try {
      final response = await dio.get("/purposes/$purposeId",
        options: Options(headers: headers),
      );

      return PurposeDto.fromJson(response.data).toEntity();
    } catch (err) {
      throw Exception(err);
    }
  }

  Future<void> addPurpose({required AddEditPurposeRequest addEditPurposeRequest}) async {
    final accessToken = await TokenSecureStorage.readAccessToken();
    Map<String, dynamic> headers = {'Authorization': accessToken};

    try {
      await dio.post("/purposes",
        data: addEditPurposeRequest.toJson(),
        options: Options(headers: headers),
      );
    } catch (err) {
      throw Exception(err);
    }
  }

  Future<void> editPurpose({required int purposeId, required AddEditPurposeRequest addPurposeRequest}) async {
    final accessToken = await TokenSecureStorage.readAccessToken();
    Map<String, dynamic> headers = {'Authorization': accessToken};

    try {
      await dio.put("/purposes/$purposeId",
        data: addPurposeRequest.toJson(),
        options: Options(headers: headers),
      );
    } catch (err) {
      throw Exception(err);
    }
  }

  Future<void> delPurpose({required int purposeId}) async {
    final accessToken = await TokenSecureStorage.readAccessToken();
    Map<String, dynamic> headers = {'Authorization': accessToken};

    try {
      await dio.delete("/purposes/$purposeId",
        options: Options(headers: headers),
      );
    } catch (err) {
      throw Exception(err);
    }
  }
}