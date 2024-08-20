import 'package:maeumgagym_flutter/domain/auth/entity/maeum_token_entity.dart';
import 'package:maeumgagym_flutter/domain/auth/repository/maeum_auth_repository.dart';

class MaeumReIssueUseCase {
  final MaeumAuthRepository _maeumAuthRepository;

  MaeumReIssueUseCase({required MaeumAuthRepository maeumAuthRepository})
      : _maeumAuthRepository = maeumAuthRepository;

  Future<MaeumTokenEntity> execute() => _maeumAuthRepository.maeumReIssue();
}
