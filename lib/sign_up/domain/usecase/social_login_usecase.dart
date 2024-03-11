import '../repository/social_login_repository.dart';

class SocialLoginUseCase {
  final SocialLoginRepository _repository;

  SocialLoginUseCase(this._repository);

  Future<bool> login() async {
    return await _repository.login();
  }

  Future<bool> logout() async {
    return await _repository.logout();
  }

  Future<String> getToken() async {
    return await _repository.getToken();
  }
}
