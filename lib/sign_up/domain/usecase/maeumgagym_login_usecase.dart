import 'package:maeum_ga_gym_flutter/sign_up/domain/repository/maeumgagym_login_repository.dart';

import '../model/maeumgagym_login_model.dart';

class MaeumgagymLoginUseCase {
  final MaeumgagymLoginRepository _repository;

  MaeumgagymLoginUseCase(this._repository);

  Future<MaeumgagymLoginModel> googleLogin(String googleToken) async {
    return await _repository.googleLogin(googleToken);
  }
}
