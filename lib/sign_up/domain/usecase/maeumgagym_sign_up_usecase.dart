import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maeum_ga_gym_flutter/sign_up/domain/repository/maeumgagym_sign_up_repository.dart';

class MaeumgagymSignUpUseCase {
  final MaeumgagymSignUpRepository _repository;

  MaeumgagymSignUpUseCase(this._repository);

  Future<AsyncValue<int?>> googleSignUp(String googleToken, String name) async {
    return await _repository.googleSignUp(googleToken, name);
  }

  Future<AsyncValue<int?>> kakaoSignUp(String googleToken, String name) async {
    return await _repository.kakaoSignUp(googleToken, name);
  }
}
