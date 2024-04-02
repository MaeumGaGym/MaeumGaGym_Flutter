import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maeum_ga_gym_flutter/sign_up/data/repositoryImpl/nickname_check_repository_impl.dart';
import 'package:maeum_ga_gym_flutter/sign_up/domain/usecase/nickname_check_usecase.dart';

final nicknameCheckController =
    StateNotifierProvider<NicknameCheckStateNotifier, AsyncValue<bool>>((ref) {
  return NicknameCheckStateNotifier();
});

class NicknameCheckStateNotifier extends StateNotifier<AsyncValue<bool>> {
  NicknameCheckStateNotifier() : super(const AsyncData(false));

  final NicknameCheckUseCase _useCase = NicknameCheckUseCase(
    repository: NicknameCheckRepositoryImpl(),
  );

  Future<void> checkNickname(String name) async {
    state = const AsyncLoading();
    final bool nicknameState = await _useCase.checkNickname(name);

    state = AsyncData(!nicknameState);
  }
}

final nicknameErrorController = StateProvider<String>((ref) => '');
