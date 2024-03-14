import 'package:maeum_ga_gym_flutter/sign_up/data/data_source/remote/maeumgagym_sign_up_remote_data_source.dart';
import 'package:maeum_ga_gym_flutter/sign_up/domain/model/maeumgagym_sign_up_model.dart';
import 'package:maeum_ga_gym_flutter/sign_up/domain/repository/maeumgagym_sign_up_repository.dart';

class MaeumgagymSignUpRepositoryImpl implements MaeumgagymSignUpRepository {
  final MaeumgagymSignUpRemoteDataSource _dataSource =
      MaeumgagymSignUpRemoteDataSource();

  @override
  Future<MaeumgagymSignUpModel> googleSignUp(
      String googleToken, String name) async {
    return await _dataSource.googleSignUp(googleToken, name);
  }

  @override
  Future<MaeumgagymSignUpModel> kakaoSignUp(
      String kakaoToken, String xsrfToken, String name) async {
    return await _dataSource.kakaoSignUp(kakaoToken, xsrfToken, name);
  }
}
