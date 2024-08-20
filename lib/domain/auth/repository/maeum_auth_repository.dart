import 'package:maeumgagym_flutter/data/auth/dto/request/maeum_sign_up_request.dart';
import 'package:maeumgagym_flutter/core/enum/social_state_enum.dart';
import 'package:maeumgagym_flutter/domain/auth/entity/maeum_token_entity.dart';

abstract class MaeumAuthRepository {
  Future<MaeumTokenEntity> maeumLogin({required SocialStateEnum socialRequest, required String oAuthToken});

  Future<MaeumTokenEntity> maeumReIssue();

  Future<void> maeumSignUp({required MaeumSignUpRequest maeumSignUpRequest});

  Future<bool> checkNickName({required String nickName});

  Future<void> maeumRecovery({required SocialStateEnum socialRequest, required String oAuthToken});

  Future<void> withdrawal();
}
