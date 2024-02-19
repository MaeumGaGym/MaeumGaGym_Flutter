import 'csrf_token_model.dart';

abstract class CSRFTokenRepository {
  Future<CSRFTokenModel> getCSRFToken();
}
