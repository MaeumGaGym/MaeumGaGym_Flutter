import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maeum_ga_gym_flutter/core/logout/domain/maeumgagym_logout_usecase.dart';
import 'package:maeum_ga_gym_flutter/core/model/social_login_model.dart';

final maeumgagymLogoutProvider = StateNotifierProvider<MaeumgagymLogoutStateNotifier, SocialLoginModel>((ref) => MaeumgagymLogoutStateNotifier());

class MaeumgagymLogoutStateNotifier extends StateNotifier<SocialLoginModel> {
  MaeumgagymLogoutStateNotifier() : super(SocialLoginModel(
    stateus: const AsyncData(false),
    token: null,
  ));

  late MaeumgagymLogoutUseCase _useCase;

  Future<void> logout() async {
    SocialLoginModel loginState = await _useCase.logout();

    SocialLoginModel(
      stateus: loginState.stateus,
      token: loginState.token,
    );

    print(loginState.token);
    print(loginState.stateus);
  }
}