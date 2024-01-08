import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maeum_ga_gym_flutter/core/riverpod/maeumgagym_text_field_riverpod.dart';

final nicknameTextFieldProvider =
    StateNotifierProvider<TextFieldStateNotifier, TextFieldState>(
        (ref) => TextFieldStateNotifier());
