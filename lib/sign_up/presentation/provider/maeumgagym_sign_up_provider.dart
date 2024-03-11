import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maeum_ga_gym_flutter/core/di/token_secure_storage_di.dart';
import 'package:maeum_ga_gym_flutter/sign_up/data/repositoryImpl/maeumgagym_sign_up_repository_impl.dart';
import 'package:maeum_ga_gym_flutter/sign_up/domain/model/maeumgagym_sign_up_model.dart';
import 'package:maeum_ga_gym_flutter/sign_up/domain/usecase/maeumgagym_sign_up_usecase.dart';

final maeumgagymSignUpController =
    StateNotifierProvider<MaeumgagymSignUpStateNotifier, MaeumgagymSignUpState>(
        (ref) {
  return MaeumgagymSignUpStateNotifier();
});

class MaeumgagymSignUpStateNotifier
    extends StateNotifier<MaeumgagymSignUpState> {
  MaeumgagymSignUpStateNotifier() : super(MaeumgagymSignUpState(statusCode: 0));

  final MaeumgagymSignUpUseCase _useCase =
      MaeumgagymSignUpUseCase(MaeumgagymSignUpRepositoryImpl());

  Future<void> googleSignUp(
      String googleToken, String xsrfToken, String name) async {
    MaeumgagymSignUpModel signUpXsrfToken =
        await _useCase.googleSignUp(googleToken, xsrfToken, name);

    await TokenSecureStorageDi.writeXSRFToken(signUpXsrfToken.xsrfToken);

    state = MaeumgagymSignUpState(
      statusCode: signUpXsrfToken.statusCode,
    );
  }

  Future<void> kakaoSignUp(
      String googleToken, String xsrfToken, String name) async {
    MaeumgagymSignUpModel signUpXsrfToken =
        await _useCase.kakaoSignUp(googleToken, xsrfToken, name);

    await TokenSecureStorageDi.writeXSRFToken(signUpXsrfToken.xsrfToken);

    state = MaeumgagymSignUpState(
      statusCode: signUpXsrfToken.statusCode,
    );
  }
}

class MaeumgagymSignUpState {
  final int statusCode;

  MaeumgagymSignUpState({required this.statusCode});
}
