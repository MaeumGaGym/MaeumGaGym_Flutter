import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

const _storage = FlutterSecureStorage();

class TokenSecureStorageDi {
  static Future<void> writeAccessToken(String? accessToken) async {
    debugPrint('maeumgagymAccessToken : $accessToken');
    await _storage.write(key: 'accessToken', value: accessToken);
  }

  static Future<void> writeRefreshToken(String? refreshToken) async {
    debugPrint('maeumgagymReFreshToken : $refreshToken');
    await _storage.write(key: 'refreshToken', value: refreshToken);
  }

  static Future<void> writeXSRFToken(String xsrfToken) async {
    debugPrint(xsrfToken);
    await _storage.write(key: 'xsrfToken', value: xsrfToken);
  }

  static Future<String?> readAccessToken() async {
    return await _storage.read(key: 'accessToken');
  }

  static Future<String?> readRefreshToken() async {
    return await _storage.read(key: 'refreshToken');
  }

  static Future<String?> readXSRFToken() async {
    return await _storage.read(key: 'xsrfToken');
  }
}
