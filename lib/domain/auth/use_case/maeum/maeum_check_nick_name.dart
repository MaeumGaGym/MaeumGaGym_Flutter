import 'package:maeumgagym_flutter/domain/auth/repository/maeum_auth_repository.dart';

class MaeumCheckNickNameUseCase {
  final MaeumAuthRepository _maeumLoginoutRepository;

  MaeumCheckNickNameUseCase({required MaeumAuthRepository maeumAuthRepository})
      : _maeumLoginoutRepository = maeumAuthRepository;

  Future<bool> execute({required String nickName}) =>
      _maeumLoginoutRepository.checkNickName(nickName: nickName);
}
