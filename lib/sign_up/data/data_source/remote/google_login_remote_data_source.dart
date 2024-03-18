import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../domain/model/social_login_model.dart';

class GoogleLoginRemoteDataSource {
  late String? _token;

  Future<SocialLoginModel> login() async {
    try {
      GoogleSignIn googleSignIn = GoogleSignIn();

      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

      _token = googleAuth?.accessToken;
      return SocialLoginModel.fromJson(const AsyncData(true), _token);
    } catch (err) {
      return SocialLoginModel.fromJson(
        AsyncError(err, StackTrace.empty),
        _token,
      );
    }
  }

  Future<SocialLoginModel> logout() async {
    try {
      await GoogleSignIn().signOut();

      return SocialLoginModel.fromJson(const AsyncData(false), null);
    } catch (err) {
      return SocialLoginModel.fromJson(AsyncError(err, StackTrace.empty), null);
    }
  }
}
