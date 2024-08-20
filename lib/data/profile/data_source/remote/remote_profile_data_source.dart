import 'package:dio/dio.dart';

import '../../../../core/token_secure_storage.dart';
import '../../../../domain/profile/entity/profile_entity.dart';
import '../../../../init/dio_init.dart';
import '../../dto/response/profile_dto.dart';

class RemoteProfileDataSource {
  Future<ProfileEntity> getProfile() async {
    final accessToken = await TokenSecureStorage.readAccessToken();
    Map<String, dynamic> headers = {'Authorization': accessToken};

    try{
      final response = await dio.get('/user', options: Options(headers: headers));
      return ProfileDto.fromJson(response.data).toEntity();
    } catch (err) {
      throw Exception(err);
    }
  }
}