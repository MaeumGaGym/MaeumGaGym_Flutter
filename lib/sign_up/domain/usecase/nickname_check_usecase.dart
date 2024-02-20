import 'package:maeum_ga_gym_flutter/sign_up/domain/repository/nickname_check_repository.dart';

class NicknameCheckUseCase {
  final NicknameCheckRepository _repository;

  NicknameCheckUseCase({required NicknameCheckRepository repository})
      : _repository = repository;

  Future<bool> checkNickname(String name) async {
    return _repository.checkNickname(name);
  }
}
