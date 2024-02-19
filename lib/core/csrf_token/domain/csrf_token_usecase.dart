import 'package:maeum_ga_gym_flutter/core/csrf_token/domain/csrf_token_repository.dart';

import 'csrf_token_model.dart';

class CSRFTokenUseCase {
  final CSRFTokenRepository _repository;

  CSRFTokenUseCase(this._repository);

  Future<CSRFTokenModel> getCSRFToken() async {
    return _repository.getCSRFToken();
  }
}