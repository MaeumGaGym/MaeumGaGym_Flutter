import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maeum_ga_gym_flutter/core/csrf_token/data/csrf_token_repository_impl.dart';
import 'package:maeum_ga_gym_flutter/core/csrf_token/domain/csrf_token_model.dart';
import 'package:maeum_ga_gym_flutter/core/csrf_token/domain/csrf_token_usecase.dart';

final csrfTokenController =
    StateNotifierProvider<CSRFTokenStateNotifier, CSRFTokenState>((ref) {
  return CSRFTokenStateNotifier();
});

class CSRFTokenStateNotifier extends StateNotifier<CSRFTokenState> {
  CSRFTokenStateNotifier() : super(CSRFTokenState(xsrfToken: ''));

  final CSRFTokenUseCase _useCase = CSRFTokenUseCase(CSRFTokenRepositoryImpl());

  Future<void> getSCRFToken() async {
    final CSRFTokenModel xsrfTokenModel = await _useCase.getCSRFToken();

    debugPrint(xsrfTokenModel.xsrfToken);

    state = CSRFTokenState(xsrfToken: xsrfTokenModel.xsrfToken);
  }
}

class CSRFTokenState {
  String xsrfToken;

  CSRFTokenState({required this.xsrfToken});
}
