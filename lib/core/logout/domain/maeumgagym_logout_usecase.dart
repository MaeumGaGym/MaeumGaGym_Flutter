import 'package:maeum_ga_gym_flutter/core/logout/domain/maeumgagym_logout_repository.dart';
import 'package:maeum_ga_gym_flutter/core/model/social_login_model.dart';

class MaeumgagymLogoutUseCase {
  final MaeumgagymLogoutRepository _repository;

  MaeumgagymLogoutUseCase(this._repository);

  Future<SocialLoginModel> logout() async {
    return await _repository.logout();
  }
}