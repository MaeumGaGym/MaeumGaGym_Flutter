import 'package:maeumgagym_flutter/core/enum/social_state_enum.dart';
import 'package:maeumgagym_flutter/domain/auth/repository/maeum_auth_repository.dart';

class MaeumRecoveryUseCase {
  final MaeumAuthRepository _maeumLoginoutRepository;

  MaeumRecoveryUseCase({required MaeumAuthRepository maeumAuthRepository})
      : _maeumLoginoutRepository = maeumAuthRepository;

  Future<void> execute({
    required SocialStateEnum socialRequest,
    required String oAuthToken,
  }) =>
      _maeumLoginoutRepository.maeumRecovery(
        socialRequest: socialRequest,
        oAuthToken: oAuthToken,
      );
}
