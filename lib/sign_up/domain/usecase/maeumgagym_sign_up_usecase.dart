import 'package:maeum_ga_gym_flutter/sign_up/domain/repository/maeumgagym_sign_up_repository.dart';

import '../model/maeumgagym_sign_up_model.dart';

class MaeumgagymSignUpUseCase {
  final MaeumgagymSignUpRepository _repository;

  MaeumgagymSignUpUseCase(this._repository);

  Future<MaeumgagymSignUpModel> googleSignUp(
      String googleToken, String name) async {
    return await _repository.googleSignUp(googleToken, name);
  }

  Future<MaeumgagymSignUpModel> kakaoSignUp(
      String googleToken, String xsrfToken, String name) async {
    return await _repository.kakaoSignUp(googleToken, xsrfToken, name);
  }
}
