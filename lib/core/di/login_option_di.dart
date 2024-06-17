import 'package:flutter_riverpod/flutter_riverpod.dart';

enum LoginOption { google, kakao }

final loginOptionController =
    StateProvider<LoginOption>((ref) => LoginOption.google);
