import '../../../domain/auth/entity/social_entity.dart';
import '../../../domain/auth/repository/social_repository.dart';
import '../data_source/remote/remote_social_data_source.dart';
import '../../../core/enum/social_state_enum.dart';

class SocialRepositoryImpl implements SocialRepository {
  final RemoteSocialDataSource _socialLoginDataSource;

  SocialRepositoryImpl({
    required RemoteSocialDataSource socialLoginDataSource,
  }) : _socialLoginDataSource = socialLoginDataSource;

  @override
  Future<SocialEntity> socialLogin({required SocialStateEnum socialLoginRequest}) {
    return _socialLoginDataSource.socialLogin(socialLoginRequest: socialLoginRequest);
  }

  @override
  Future<void> socialLogout({required SocialStateEnum socialLoginRequest}) {
    return _socialLoginDataSource.socialLogout(socialLoginRequest: socialLoginRequest);
  }
}
