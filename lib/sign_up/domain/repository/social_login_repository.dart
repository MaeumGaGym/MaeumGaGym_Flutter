import '../model/social_login_model.dart';

abstract class SocialLoginRepository {
  Future<SocialLoginModel> login();

  Future<SocialLoginModel> logout();
}
