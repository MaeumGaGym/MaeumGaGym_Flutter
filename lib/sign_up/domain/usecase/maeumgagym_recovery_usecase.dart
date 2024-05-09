import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maeum_ga_gym_flutter/core/di/init.dart';
import 'package:maeum_ga_gym_flutter/sign_up/domain/repository/maeumgagym_recovery_repository.dart';

class MaeumgagymRecoveryUseCase {
  final MaeumgagymRecoveryRepository _repository =
      locator<MaeumgagymRecoveryRepository>();

  Future<AsyncValue<int>> googleRecovery(String googleToken) async {
    return await _repository.googleRecovery(googleToken);
  }

  Future<AsyncValue<int>> kakaoRecovery(String kakaoToken) async {
    return await _repository.kakaoRecovery(kakaoToken);
  }
}
