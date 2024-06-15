import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maeum_ga_gym_flutter/core/di/login_option_di.dart';
import 'package:maeum_ga_gym_flutter/core/logout/data/maeumgagym_logout_repository_impl.dart';
import 'package:maeum_ga_gym_flutter/core/logout/domain/maeumgagym_logout_usecase.dart';
import 'package:maeum_ga_gym_flutter/core/model/social_login_model.dart';

final maeumgagymLogoutProvider =
    StateNotifierProvider<MaeumgagymLogoutStateNotifier, SocialLoginModel>(
        (ref) => MaeumgagymLogoutStateNotifier());

class MaeumgagymLogoutStateNotifier extends StateNotifier<SocialLoginModel> {
  MaeumgagymLogoutStateNotifier()
      : super(SocialLoginModel(
          stateus: const AsyncData(false),
          token: null,
        ));

  final MaeumgagymLogoutUseCase _useCase =
      MaeumgagymLogoutUseCase(MaeumgagymLogoutRepositoryImpl());

  Future<void> logout({
    required LoginOption loginOption,
  }) async {
    SocialLoginModel loginState = SocialLoginModel(stateus: const AsyncData(false), token: null);

    switch (loginOption) {
      case LoginOption.kakao:
        loginState = await _useCase.kakaoLogout();
        break;
      case LoginOption.google:
        loginState = await _useCase.googleLogout();
        break;
      default:
        break;
    }
    state = state.copyWith(
      status: loginState.stateus,
      token: loginState.token,
    );
  }
}
