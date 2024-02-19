import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:maeum_ga_gym_flutter/sign_up/data/repositoryImpl/maeumgagym_login_repository_impl.dart';
import 'package:maeum_ga_gym_flutter/sign_up/domain/usecase/maeumgagym_login_usecase.dart';

import '../../domain/model/maeumgagym_login_model.dart';

final maeumgagymLoginController =
    StateNotifierProvider<MaeumgagymLoginStateNotifier, MaeumgagymLoginState>(
        (ref) {
  return MaeumgagymLoginStateNotifier();
});

class MaeumgagymLoginStateNotifier extends StateNotifier<MaeumgagymLoginState> {
  MaeumgagymLoginStateNotifier()
      : super(MaeumgagymLoginState(stateusCode: 404));

  final MaeumgagymLoginUseCase _useCase =
      MaeumgagymLoginUseCase(MaeumgagymLoginRepositoryImpl());
  final storage = const FlutterSecureStorage();

  Future<void> googleLogin(String googleToken) async {
    MaeumgagymLoginModel googleLoginToken =
        await _useCase.googleLogin(googleToken);

    await storage.write(
      key: MaeumgagymLoginState.accessToken,
      value: googleLoginToken.accessToken,
    );
    await storage.write(
      key: MaeumgagymLoginState.refreshToken,
      value: googleLoginToken.refreshToken,
    );
    await storage.write(
      key: MaeumgagymLoginState.xsrfToken,
      value: googleLoginToken.xsrfToken,
    );

    state = MaeumgagymLoginState(stateusCode: googleLoginToken.statusCode);
  }

  Future<void> kakaoLogin(String kakaoToken) async {
    MaeumgagymLoginModel kakaoLoginToken =
        await _useCase.kakaoLogin(kakaoToken);

    await storage.write(
      key: MaeumgagymLoginState.accessToken,
      value: kakaoLoginToken.accessToken,
    );
    await storage.write(
      key: MaeumgagymLoginState.refreshToken,
      value: kakaoLoginToken.refreshToken,
    );
    await storage.write(
      key: MaeumgagymLoginState.xsrfToken,
      value: kakaoLoginToken.xsrfToken,
    );

    state = MaeumgagymLoginState(stateusCode: kakaoLoginToken.statusCode);
  }
}

class MaeumgagymLoginState {
  static String accessToken = 'accessToken';
  static String refreshToken = 'refreshToken';
  static String xsrfToken = 'exrfToken';

  final int stateusCode;

  MaeumgagymLoginState({required this.stateusCode});
}
