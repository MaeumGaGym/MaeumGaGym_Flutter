import '../../repository/social_repository.dart';
import '../../../../core/enum/social_state_enum.dart';

class SocialLogoutUseCase {
  final SocialRepository _socialLoginRepository;

  SocialLogoutUseCase({required SocialRepository socialLoginRepository})
      : _socialLoginRepository = socialLoginRepository;

  Future<void> execute({required SocialStateEnum socialRequest}) =>
      _socialLoginRepository.socialLogout(
        socialLoginRequest: socialRequest,
      );
}