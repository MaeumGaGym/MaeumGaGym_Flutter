import '../../../../core/enum/social_state_enum.dart';
import '../../entity/social_entity.dart';
import '../../repository/social_repository.dart';

class SocialLoginUseCase {
  final SocialRepository _socialLoginRepository;

  SocialLoginUseCase({required SocialRepository socialLoginRepository})
      : _socialLoginRepository = socialLoginRepository;

  Future<SocialEntity> execute({required SocialStateEnum socialRequest}) =>
      _socialLoginRepository.socialLogin(
        socialLoginRequest: socialRequest,
      );
}
