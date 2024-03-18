import 'package:flutter_riverpod/flutter_riverpod.dart';

enum LoginOption { google, kakao, all }

final loginOptionController =
    StateProvider<LoginOption>((ref) => LoginOption.all);
