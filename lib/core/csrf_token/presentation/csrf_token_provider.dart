import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maeum_ga_gym_flutter/core/csrf_token/data/csrf_token_repository_impl.dart';
import 'package:maeum_ga_gym_flutter/core/csrf_token/domain/csrf_token_model.dart';
import 'package:maeum_ga_gym_flutter/core/csrf_token/domain/csrf_token_usecase.dart';
import 'package:maeum_ga_gym_flutter/core/di/token_secure_storage_di.dart';

final csrfTokenController =
    StateNotifierProvider<CSRFTokenStateNotifier, CSRFTokenState>((ref) {
  return CSRFTokenStateNotifier();
});

class CSRFTokenStateNotifier extends StateNotifier<CSRFTokenState> {
  CSRFTokenStateNotifier() : super(CSRFTokenState(statusCode: 0));

  final CSRFTokenUseCase _useCase = CSRFTokenUseCase(CSRFTokenRepositoryImpl());

  Future<void> getCSRFToken() async {
    final CSRFTokenModel xsrfTokenModel = await _useCase.getCSRFToken();

    debugPrint(xsrfTokenModel.xsrfToken);

    await TokenSecureStorageDi.writeXSRFToken(xsrfTokenModel.xsrfToken);
    state = CSRFTokenState(statusCode: xsrfTokenModel.statusCode);
  }
}

class CSRFTokenState {
  int statusCode;

  CSRFTokenState({required this.statusCode});
}
