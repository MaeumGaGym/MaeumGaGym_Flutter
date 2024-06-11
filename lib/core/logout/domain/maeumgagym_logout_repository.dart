import 'package:maeum_ga_gym_flutter/core/model/social_login_model.dart';

abstract class MaeumgagymLogoutRepository {
  Future<SocialLoginModel> logout();
}