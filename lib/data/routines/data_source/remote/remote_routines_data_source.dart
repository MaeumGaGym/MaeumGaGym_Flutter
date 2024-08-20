import 'package:dio/dio.dart';
import 'package:maeumgagym_flutter/core/token_secure_storage.dart';
import 'package:maeumgagym_flutter/data/routines/dto/request/add_routine_request.dart';
import 'package:maeumgagym_flutter/data/routines/dto/response/routine_dto.dart';
import 'package:maeumgagym_flutter/data/routines/dto/response/routines_dto.dart';
import 'package:maeumgagym_flutter/domain/routines/entity/routine_entity.dart';
import 'package:maeumgagym_flutter/domain/routines/entity/routines_entity.dart';

import '../../../../init/dio_init.dart';

class RemoteRoutinesDataSource {
  Future<RoutinesEntity> getTodayRoutines() async {
    final accessToken = await TokenSecureStorage.readAccessToken();
    Map<String, dynamic> headers = {'Authorization': accessToken};

    try {
      final response = await dio.get('/routines/today', options: Options(headers: headers));
      return RoutinesDto.fromJson(response.data).toEntity();
    } catch (err) {
      throw Exception(err);
    }
  }

  Future<RoutinesEntity> getRoutines({required int index}) async {
    final accessToken = await TokenSecureStorage.readAccessToken();
    Map<String, dynamic> headers = {'Authorization': accessToken};

    try {
      final response = await dio.get("/routines/my",
        queryParameters: {"index": index},
        options: Options(headers: headers),
      );

      return RoutinesDto.fromJson(response.data).toEntity();
    } catch (err) {
      throw Exception(err);
    }
  }

  Future<void> addRoutine({required AddEditRoutineRequest addRoutineRequest}) async {
    final accessToken = await TokenSecureStorage.readAccessToken();
    Map<String, dynamic> headers = {'Authorization': accessToken};

    try {
      await dio.post(
        "/routines",
        data: addRoutineRequest.toJson(),
        options: Options(headers: headers),
      );
    } catch (err) {
      throw Exception(err);
    }
  }

  Future<void> editRoutine({required int routineId, required AddEditRoutineRequest addRoutineRequest}) async {
    final accessToken = await TokenSecureStorage.readAccessToken();
    Map<String, dynamic> headers = {'Authorization': accessToken};

    try {
      await dio.put(
        "/routines/$routineId",
        data: addRoutineRequest.toJson(),
        options: Options(headers: headers),
      );
    } catch (err) {
      throw Exception(err);
    }
  }

  Future<void> delRoutine({required int routineId}) async {
    final accessToken = await TokenSecureStorage.readAccessToken();
    Map<String, dynamic> headers = {'Authorization': accessToken};

    try {
      await dio.delete(
        "/routines/$routineId",
        options: Options(headers: headers),
      );
    } catch (err) {
      throw Exception(err);
    }
  }

  Future<RoutineEntity> getRoutineDetail({required int routineId}) async {
    final accessToken = await TokenSecureStorage.readAccessToken();
    Map<String, dynamic> headers = {'Authorization': accessToken};

    try {
      final response =  await dio.get("/routines/$routineId", options: Options(headers: headers));

      return RoutineDto.fromJson(response.data).toEntity();
    } catch (err) {
      throw Exception(err);
    }
  }
}