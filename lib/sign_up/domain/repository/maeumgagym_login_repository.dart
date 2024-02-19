import '../model/maeumgagym_login_model.dart';

abstract class MaeumgagymLoginRepository {
  Future<MaeumgagymLoginModel> googleLogin(String googleToken);
}
