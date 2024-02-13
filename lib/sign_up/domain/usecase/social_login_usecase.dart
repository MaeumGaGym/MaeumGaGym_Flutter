import '../repository/social_login_repository.dart';

class SocialLoginUseCase {
  final SocialLoginRepository _repository;

  SocialLoginUseCase(this._repository);

  Future<bool> login() {
    return _repository.login();
  }

  Future<bool> logout() {
    return _repository.logout();
  }

  Future<String> getToken() {
    return _repository.getToken();
  }
}
