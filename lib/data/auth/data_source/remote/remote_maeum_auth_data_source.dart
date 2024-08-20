import 'package:dio/dio.dart';
import 'package:maeumgagym_flutter/init/dio_init.dart';
import 'package:maeumgagym_flutter/core/enum/social_state_enum.dart';
import 'package:maeumgagym_flutter/core/token_secure_storage.dart';
import 'package:maeumgagym_flutter/data/auth/dto/response/maeum_token_dto.dart';
import 'package:maeumgagym_flutter/domain/auth/entity/maeum_token_entity.dart';

import '../../dto/request/maeum_sign_up_request.dart';

class RemoteMaeumAuthDataSource {
  /// Login
  Future<MaeumTokenEntity> maeumLogin(
      {required SocialStateEnum socialRequest, required String oAuthToken}) {
    switch (socialRequest) {
      case SocialStateEnum.google:
        return _googleLogin(googleToken: oAuthToken);
      case SocialStateEnum.kakao:
        return _kakaoLogin(kakaoToken: oAuthToken);
    }
  }

  Future<MaeumTokenEntity> _googleLogin({required String googleToken}) async {
    Map<String, dynamic> header = {"OAUTH-TOKEN": googleToken};

    try {
      final response = await dio.get('/google/login', options: Options(headers: header));

      return MaeumTokenDto.fromJson(response.headers).toEntity();
    } catch (err) {
      throw Exception("Maeumgagym google login : $err");
    }
  }

  Future<MaeumTokenEntity> _kakaoLogin({required String kakaoToken}) async {
    Map<String, dynamic> header = {"OAUTH-TOKEN": kakaoToken};

    try {
      final response = await dio.get('/kakao/login', options: Options(headers: header));

      return MaeumTokenDto.fromJson(response.headers).toEntity();
    } catch (err) {
      throw Exception("Maeumgagym kakao login : $err");
    }
  }

  /// SignUp
  Future<void> maeumSignUp({required MaeumSignUpRequest maeumSignUpRequest}) async {
    switch (maeumSignUpRequest.socialEnum) {
      case SocialStateEnum.google:
        return _googleSignUp(
          googleToken: maeumSignUpRequest.oAuthToken,
          nickName: maeumSignUpRequest.nickName,
        );
      case SocialStateEnum.kakao:
        return _kakaoSignUp(
          kakaoToken: maeumSignUpRequest.oAuthToken,
          nickName: maeumSignUpRequest.nickName,
        );
    }
  }

  Future<void> _googleSignUp({required String googleToken,required String nickName}) async {
    Map<String, String> data = {"nickname": nickName};
    Map<String, dynamic> header = {"OAUTH-TOKEN": googleToken};

    try{
      await dio.post(
        '/google/signup',
        options: Options(headers: header),
        data: data,
      );
    } catch (err) {
      throw Exception(err);
    }
  }

  Future<void> _kakaoSignUp({required String kakaoToken,required String nickName}) async {
    Map<String, String> data = {"nickname": nickName};
    Map<String, dynamic> header = {"OAUTH-TOKEN": kakaoToken};

    try{
      await dio.post(
        '/kakao/signup',
        options: Options(headers: header),
        data: data,
      );
    } catch (err) {
      throw Exception(err);
    }
  }

  /// Recovery
  Future<void> maeumRecovery({required SocialStateEnum socialRequest, required String oAuthToken}) async {
    switch (socialRequest) {
      case SocialStateEnum.google:
        return _googleRecovery(googleToken: oAuthToken);
      case SocialStateEnum.kakao:
        return _kakaoRecovery(kakaoToken: oAuthToken);
    }
  }

  Future<void> _googleRecovery({required String googleToken}) async {
    Map<String, dynamic> header = {"OAUTH-TOKEN": googleToken};

    try {
      await dio.put('/google/recovery', options: Options(headers: header));
    } catch (err) {
      throw Exception("Maeumgagym google recovery : $err");
    }
  }

  Future<void> _kakaoRecovery({required String kakaoToken}) async {
    Map<String, dynamic> header = {"OAUTH-TOKEN": kakaoToken};

    try {
      await dio.put('/kakao/recovery', options: Options(headers: header));
    } catch (err) {
      throw Exception("Maeumgagym google recovery : $err");
    }
  }

  /// Check NickName
  Future<bool> checkNickname({required String nickName}) async {
    return await dio.get('/auth/nickname/$nickName').then((response) {
      return response.data;
    });
  }

  /// ReIssue
  Future<MaeumTokenEntity> maeumReIssue() async {
    String? refreshToken = await TokenSecureStorage.readRefreshToken();
    Map<String, dynamic> header = {"RF-TOKEN": refreshToken};

    try {
      final response = await dio.get('/auth/re-issue', options: Options(headers: header));

      return MaeumTokenDto.fromJson(response.headers).toEntity();
    } catch (err) {
      throw Exception(err);
    }
  }

  /// Withdrawal
  Future<void> maeumWithdrawal() async {
    try {
      final accessToken = await TokenSecureStorage.readAccessToken();
      Map<String, dynamic> headers = {'Authorization': accessToken};

      dio.delete("/sign_up", options: Options(headers: headers));
    } catch (err) {
      throw Exception(err);
    }
  }
}
