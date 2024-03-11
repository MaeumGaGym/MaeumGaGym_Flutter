import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maeum_ga_gym_flutter/sign_up/data/repositoryImpl/nickname_check_repository_impl.dart';
import 'package:maeum_ga_gym_flutter/sign_up/domain/usecase/nickname_check_usecase.dart';

final nicknameCheckController =
    StateNotifierProvider<NicknameCheckStateNotifier, NicknameCheckState>(
        (ref) {
  return NicknameCheckStateNotifier();
});

class NicknameCheckStateNotifier extends StateNotifier<NicknameCheckState> {
  NicknameCheckStateNotifier()
      : super(NicknameCheckState(notDuplicating: true));

  final NicknameCheckUseCase _useCase =
      NicknameCheckUseCase(repository: NicknameCheckRepositoryImpl());

  Future<void> checkNickname(String name) async {
    final bool nicknameState = await _useCase.checkNickname(name);

    state = NicknameCheckState(notDuplicating: !nicknameState);
  }
}

class NicknameCheckState {
  bool notDuplicating;

  NicknameCheckState({
    required this.notDuplicating,
  });
}
