import '../model/maeumgagym_sign_up_model.dart';

abstract class MaeumgagymSignUpRepository {
  Future<MaeumgagymSignUpModel> googleSignUp(
      String googleToken, String xsrfToken, String name);

  Future<MaeumgagymSignUpModel> kakaoSignUp(
      String kakaoToken, String xsrfToken, String name);
}
