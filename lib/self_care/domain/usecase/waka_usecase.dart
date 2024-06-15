import 'package:maeum_ga_gym_flutter/self_care/domain/model/waka/waka_response_model.dart';
import 'package:maeum_ga_gym_flutter/self_care/domain/repository/waka_repository.dart';

class WakaUseCase {
  final WakaRepository _repository;

  WakaUseCase(this._repository);

  Future<WakaResponseModel> totalWaka({
    required String accessToken,
  }) async {
    return await _repository.totalWaka(
      accessToken: accessToken,
    );
  }

  Future<WakaResponseModel> dailyWaka({
    required String accessToken,
  }) async {
    return await _repository.totalWaka(
      accessToken: accessToken,
    );
  }
}
