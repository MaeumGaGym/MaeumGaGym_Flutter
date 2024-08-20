import '../../repository/maeum_auth_repository.dart';

class MaeumWithdrawalUseCase {
  final MaeumAuthRepository _maeumLoginoutRepository;

  MaeumWithdrawalUseCase({required MaeumAuthRepository maeumLoginoutRepository})
      : _maeumLoginoutRepository = maeumLoginoutRepository;

  Future<void> execute() => _maeumLoginoutRepository.withdrawal();
}