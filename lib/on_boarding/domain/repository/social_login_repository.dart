abstract class SocialLoginRepository {
  Future<bool> login();

  Future<bool> logout();

  Future<String> getToken();
}
