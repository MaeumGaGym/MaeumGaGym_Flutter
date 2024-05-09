import 'package:maeum_ga_gym_flutter/sign_up/domain/repository/nickname_check_repository.dart';

import '../../../core/di/init.dart';

class NicknameCheckUseCase {
  final NicknameCheckRepository _repository =
      locator<NicknameCheckRepository>();

  Future<bool> checkNickname(String name) async {
    return _repository.checkNickname(name);
  }
}
