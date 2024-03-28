import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class MaeumgagymSignUpRepository {
  Future<AsyncValue<int?>> googleSignUp(String googleToken, String name);

  Future<AsyncValue<int?>> kakaoSignUp(String kakaoToken, String name);
}
