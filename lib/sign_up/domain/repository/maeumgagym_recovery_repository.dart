import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class MaeumgagymRecoveryRepository {
  Future<AsyncValue<int>> googleRecovery(String googleToken);

  Future<AsyncValue<int>> kakaoRecovery(String kakaoToken);
}
