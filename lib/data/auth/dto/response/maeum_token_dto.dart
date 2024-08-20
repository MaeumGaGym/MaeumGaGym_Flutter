import 'package:dio/dio.dart';
import 'package:maeumgagym_flutter/domain/auth/entity/maeum_token_entity.dart';

class MaeumTokenDto {
  final String accessToken;
  final String refreshToken;

  MaeumTokenDto({
    required this.accessToken,
    required this.refreshToken,
  });

  factory MaeumTokenDto.fromJson(Headers json) {
    String jsonRFToken = json.map['set-cookie']![0];

    return MaeumTokenDto(
      accessToken: json.value('authorization').toString(),
      refreshToken: jsonRFToken.substring(9, jsonRFToken.indexOf(';')),
    );
  }

  MaeumTokenEntity toEntity() {
    return MaeumTokenEntity(
      accessToken: accessToken,
      refreshToken: refreshToken,
    );
  }
}
