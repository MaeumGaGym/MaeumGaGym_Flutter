import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maeum_ga_gym_flutter/sign_up/data/repositoryImpl/maeumgagym_sign_up_repository_impl.dart';
import 'package:maeum_ga_gym_flutter/sign_up/domain/usecase/maeumgagym_sign_up_usecase.dart';

final maeumgagymSignUpController =
    StateNotifierProvider<MaeumgagymSignUpStateNotifier, AsyncValue<int?>>(
        (ref) {
  return MaeumgagymSignUpStateNotifier();
});

class MaeumgagymSignUpStateNotifier extends StateNotifier<AsyncValue<int?>> {
  MaeumgagymSignUpStateNotifier() : super(const AsyncData(500));

  final MaeumgagymSignUpUseCase _useCase =
      MaeumgagymSignUpUseCase(MaeumgagymSignUpRepositoryImpl());

  Future<void> googleSignUp(String googleToken, String name) async {
    state = const AsyncLoading();
    AsyncValue<int?> signUpState =
        await _useCase.googleSignUp(googleToken, name);

    state = signUpState;
  }

  Future<void> kakaoSignUp(String googleToken, String name) async {
    AsyncValue<int?> signUpState =
        await _useCase.kakaoSignUp(googleToken, name);

    state = signUpState;
  }
}
