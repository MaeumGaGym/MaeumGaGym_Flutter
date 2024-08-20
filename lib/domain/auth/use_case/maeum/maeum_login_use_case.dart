import 'package:maeumgagym_flutter/core/enum/social_state_enum.dart';
import 'package:maeumgagym_flutter/domain/auth/entity/maeum_token_entity.dart';
import 'package:maeumgagym_flutter/domain/auth/repository/maeum_auth_repository.dart';

class MaeumLoginUseCase {
  final MaeumAuthRepository _maeumLoginoutRepository;

  MaeumLoginUseCase({required MaeumAuthRepository maeumAuthRepository})
      : _maeumLoginoutRepository = maeumAuthRepository;

  Future<MaeumTokenEntity> execute({
    required SocialStateEnum socialRequest,
    required String oAuthToken,
  }) =>
      _maeumLoginoutRepository.maeumLogin(
        socialRequest: socialRequest,
        oAuthToken: oAuthToken,
      );
}
