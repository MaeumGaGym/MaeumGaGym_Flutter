import '../../../core/model/social_login_model.dart';
import '../repository/social_login_repository.dart';

class SocialLoginUseCase {
  final SocialLoginRepository _repository;

  SocialLoginUseCase(this._repository);

  Future<SocialLoginModel> login() async {
    return await _repository.login();
  }
}
