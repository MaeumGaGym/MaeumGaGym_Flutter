import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

const _storage = FlutterSecureStorage(
  aOptions: AndroidOptions(encryptedSharedPreferences: true),
);

class TokenSecureStorageDi {
  static Future<void> writeLoginAccessToken(String? accessToken) async {
    debugPrint('maeumgagymAccessToken : $accessToken');
    await _storage.write(key: 'LoginAccessToken', value: accessToken);
  }

  static Future<void> writeLoginRefreshToken(String? refreshToken) async {
    debugPrint('maeumgagymReFreshToken : $refreshToken');
    await _storage.write(key: 'LoginRefreshToken', value: refreshToken);
  }

  static Future<String?> readLoginAccessToken() async {
    return await _storage.read(key: 'LoginAccessToken');
  }

  static Future<String?> readLoginRefreshToken() async {
    return await _storage.read(key: 'LoginRefreshToken');
  }

  static Future<String?> readXSRFToken() async {
    return await _storage.read(key: 'xsrfToken');
  }

  static Future<void> writeXSRFToken(String xsrfToken) async {
    debugPrint(xsrfToken);
    await _storage.write(key: 'xsrfToken', value: xsrfToken);
  }
}
