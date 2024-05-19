import 'package:maeum_ga_gym_flutter/self_care/domain/model/waka/waka_response_model.dart';

abstract class WakaRepository {
  Future<WakaResponseModel> totalWaka({
    required String accessToken,
  });

  Future<WakaResponseModel> dailyWaka({
    required String accessToken,
  });
}
