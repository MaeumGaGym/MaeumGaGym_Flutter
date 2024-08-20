import 'package:maeumgagym_flutter/data/auth/dto/request/maeum_sign_up_request.dart';
import 'package:maeumgagym_flutter/domain/auth/repository/maeum_auth_repository.dart';

class MaeumSignUpUseCase {
  final MaeumAuthRepository _maeumLoginoutRepository;

  MaeumSignUpUseCase({required MaeumAuthRepository maeumAuthRepository})
      : _maeumLoginoutRepository = maeumAuthRepository;

  Future<void> execute({required MaeumSignUpRequest maeumSignUpRequest}) =>
      _maeumLoginoutRepository.maeumSignUp(maeumSignUpRequest: maeumSignUpRequest);
}
