import 'package:dio/dio.dart';
import 'package:maeumgagym_flutter/core/token_secure_storage.dart';
import 'package:maeumgagym_flutter/data/quotes/dto/response/quotes_dto.dart';
import 'package:maeumgagym_flutter/domain/quotes/entity/quotes_entity.dart';

import '../../../../init/dio_init.dart';

class RemoteQuotesDataSource {
  Future<QuotesEntity> getQuotes() async {
    final String? accessToken = await TokenSecureStorage.readAccessToken();
    Map<String, dynamic> headers = {'Authorization': accessToken};

    try{
      final response = await dio.get('/quotes', options: Options(headers: headers));
      return QuotesDto.fromJson(response.data).toEntity();
    } catch (err) {
      throw Exception(err);
    }
  }
}