import '../../../core/enum/social_state_enum.dart';
import '../entity/social_entity.dart';

abstract class SocialRepository {
  Future<SocialEntity> socialLogin({required SocialStateEnum socialLoginRequest});
  Future<void> socialLogout({required SocialStateEnum socialLoginRequest});
}
