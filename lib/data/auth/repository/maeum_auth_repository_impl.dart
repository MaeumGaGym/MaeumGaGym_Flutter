import 'package:maeumgagym_flutter/data/auth/data_source/remote/remote_maeum_auth_data_source.dart';
import 'package:maeumgagym_flutter/data/auth/dto/request/maeum_sign_up_request.dart';
import 'package:maeumgagym_flutter/core/enum/social_state_enum.dart';
import 'package:maeumgagym_flutter/domain/auth/entity/maeum_token_entity.dart';
import 'package:maeumgagym_flutter/domain/auth/repository/maeum_auth_repository.dart';

class MaeumAuthRepositoryImpl implements MaeumAuthRepository {
  final RemoteMaeumAuthDataSource _remoteMaeumAuthDataSource;

  MaeumAuthRepositoryImpl({
    required RemoteMaeumAuthDataSource remoteMaeumAuthDataSource,
  }) : _remoteMaeumAuthDataSource = remoteMaeumAuthDataSource;

  @override
  Future<MaeumTokenEntity> maeumLogin({required SocialStateEnum socialRequest, required String oAuthToken}) async {
    return await _remoteMaeumAuthDataSource.maeumLogin(socialRequest: socialRequest, oAuthToken: oAuthToken);
  }

  @override
  Future<void> maeumSignUp({required MaeumSignUpRequest maeumSignUpRequest}) async {
    return await _remoteMaeumAuthDataSource.maeumSignUp(maeumSignUpRequest: maeumSignUpRequest);
  }

  @override
  Future<void> maeumRecovery({required SocialStateEnum socialRequest, required String oAuthToken}) async {
    return await _remoteMaeumAuthDataSource.maeumRecovery(socialRequest: socialRequest, oAuthToken: oAuthToken);
  }

  @override
  Future<void> withdrawal() async {
    return await _remoteMaeumAuthDataSource.maeumWithdrawal();
  }

  @override
  Future<bool> checkNickName({required String nickName}) async {
    return await _remoteMaeumAuthDataSource.checkNickname(nickName: nickName);
  }

  @override
  Future<MaeumTokenEntity> maeumReIssue() async {
    return await _remoteMaeumAuthDataSource.maeumReIssue();
  }
}
