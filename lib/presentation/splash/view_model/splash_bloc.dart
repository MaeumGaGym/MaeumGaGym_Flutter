import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maeumgagym_flutter/core/token_secure_storage.dart';
import 'package:maeumgagym_flutter/domain/auth/entity/maeum_token_entity.dart';
import 'package:maeumgagym_flutter/domain/auth/use_case/maeum/maeum_re_issue_use_case.dart';
import 'package:maeumgagym_flutter/presentation/splash/view_model/splash_event.dart';
import 'package:maeumgagym_flutter/presentation/splash/view_model/splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState<void>> {
  final MaeumReIssueUseCase _maeumReIssueUseCase;

  SplashBloc({required MaeumReIssueUseCase maeumReIssueUseCase})
      : _maeumReIssueUseCase = maeumReIssueUseCase,
        super(Empty()) {
    on<SplashEvent>(_maeumSplashHandler);
  }

  void _maeumSplashHandler(
    SplashEvent event,
    Emitter<SplashState<void>> emit,
  ) async {
    try{
      MaeumTokenEntity maeumTokenEntity = await _maeumReIssueUseCase.execute();

      TokenSecureStorage.writeAccessToken(maeumTokenEntity.accessToken);
      TokenSecureStorage.writeRefreshToken(maeumTokenEntity.refreshToken);

      emit(Loaded(data: null));
    } catch (err) {
      emit(Error(exception: err));
    }
  }
}