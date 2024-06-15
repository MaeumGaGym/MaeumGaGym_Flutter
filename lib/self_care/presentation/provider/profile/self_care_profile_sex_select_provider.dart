import 'package:flutter_riverpod/flutter_riverpod.dart';

/// 위젯이 활성화 되었는지 확인
final dropDownCheckProvider = StateProvider.autoDispose<bool>((ref) => false);

/// 어떤 성별을 선택했는지 확인
final sexSelectProvider = StateProvider.autoDispose<String>((ref) => "");