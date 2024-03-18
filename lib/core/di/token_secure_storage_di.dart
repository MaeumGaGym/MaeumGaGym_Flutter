import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

const _storage = FlutterSecureStorage();

class TokenSecureStorageDi {
  static Future<void> writeGoogleLoginAccessToken(String? accessToken) async {
    debugPrint('maeumgagymAccessToken : $accessToken');
    await _storage.write(key: 'GoogleLoginAccessToken', value: accessToken);
  }

  static Future<void> writeGoogleLoginRefreshToken(String? refreshToken) async {
    debugPrint('maeumgagymReFreshToken : $refreshToken');
    await _storage.write(key: 'GoogleLoginRefreshToken', value: refreshToken);
  }

  static Future<void> writeKaKaoLoginAccessToken(String? accessToken) async {
    debugPrint('maeumgagymAccessToken : $accessToken');
    await _storage.write(key: 'KaKaoLoginAccessToken', value: accessToken);
  }

  static Future<void> writeKaKaoLoginRefreshToken(String? refreshToken) async {
    debugPrint('maeumgagymReFreshToken : $refreshToken');
    await _storage.write(key: 'KaKaoLoginRefreshToken', value: refreshToken);
  }

  static Future<String?> readGoogleLoginAccessToken() async {
    return await _storage.read(key: 'GoogleLoginAccessToken');
  }

  static Future<String?> readGoogleLoginRefreshToken() async {
    return await _storage.read(key: 'GoogleLoginRefreshToken');
  }

  static Future<String?> readKaKaoLoginAccessToken() async {
    return await _storage.read(key: 'KaKaoLoginAccessToken');
  }

  static Future<String?> readKaKaoLoginRefreshToken() async {
    return await _storage.read(key: 'KaKaoLoginRefreshToken');
  }

  static Future<String?> readXSRFToken() async {
    return await _storage.read(key: 'xsrfToken');
  }

  static Future<void> writeXSRFToken(String xsrfToken) async {
    debugPrint(xsrfToken);
    await _storage.write(key: 'xsrfToken', value: xsrfToken);
  }
}
