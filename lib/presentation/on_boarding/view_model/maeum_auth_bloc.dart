import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maeumgagym_flutter/core/token_secure_storage.dart';
import 'package:maeumgagym_flutter/core/enum/social_state_enum.dart';
import 'package:maeumgagym_flutter/domain/auth/entity/maeum_token_entity.dart';
import 'package:maeumgagym_flutter/domain/auth/entity/social_entity.dart';
import 'package:maeumgagym_flutter/domain/auth/use_case/maeum/maeum_login_use_case.dart';
import 'package:maeumgagym_flutter/domain/auth/use_case/social/social_login_use_case.dart';
import 'package:maeumgagym_flutter/domain/auth/use_case/social/social_logout_use_case.dart';
import '../../../domain/auth/use_case/maeum/maeum_recovery_use_case.dart';
import 'maeum_auth_event.dart';
import 'maeum_auth_model.dart';
import 'maeum_auth_state.dart';

class MaeumAuthBloc extends Bloc<MaeumAuthEvent, MaeumAuthState<MaeumAuthModel>>{
  final SocialLoginUseCase _socialLoginUseCase;
  final SocialLogoutUseCase _socialLogoutUseCase;
  final MaeumLoginUseCase _maeumLoginUseCase;
  final MaeumRecoveryUseCase _maeumRecoveryUseCase;

  MaeumAuthBloc({
    required SocialLoginUseCase socialLoginUseCase,
    required SocialLogoutUseCase socialLogoutUseCase,
    required MaeumLoginUseCase maeumLoginUseCase,
    required MaeumRecoveryUseCase maeumRecoveryUseCase,
  })  : _socialLoginUseCase = socialLoginUseCase,
        _socialLogoutUseCase = socialLogoutUseCase,
        _maeumLoginUseCase = maeumLoginUseCase,
        _maeumRecoveryUseCase = maeumRecoveryUseCase,
        super(Empty()) {
    //concurrent : bloc의 기본 처리 방식 - transfomer에 따로 적지 않아도 됨
    //sequential : 동기 방식 이벤트가 종료 되면 다음것 수행
    //droppable : 이전 이벤트가 처리되는 동안 들어오는 이벤트 제거
    //restartable : 최근 이벤트만 수행 이전 이벤트는 제거
    on<MaeumLoginEvent>(_maeumLoginHandler, transformer: droppable());
    on<MaeumSocialLogoutEvent>(_maeumSocialLogoutHandler);
  }

  void _maeumLoginHandler(MaeumLoginEvent event, Emitter<MaeumAuthState<MaeumAuthModel>> emit) async {
    emit(Loading());
    SocialStateEnum socialEnum = event.socialRequest;

    try{
      // social login
      SocialEntity socialEntity = await _socialLoginUseCase.execute(socialRequest: socialEnum);

      try {
        // maeum login
        MaeumTokenEntity maeumLoginEntity = await _maeumLoginUseCase.execute(socialRequest: socialEnum, oAuthToken: socialEntity.token);

        TokenSecureStorage.writeAccessToken(maeumLoginEntity.accessToken);
        TokenSecureStorage.writeRefreshToken(maeumLoginEntity.refreshToken);

        emit(Loaded());
      } catch (err) {

        if(err.toString().contains("404")){
          // maeum login fail 404
          try {
            // recovery
            await _maeumRecoveryUseCase.execute(socialRequest: socialEnum, oAuthToken: socialEntity.token);

            // 200
            MaeumTokenEntity maeumLoginEntity = await _maeumLoginUseCase.execute(socialRequest: socialEnum, oAuthToken: socialEntity.token);

            TokenSecureStorage.writeAccessToken(maeumLoginEntity.accessToken);
            TokenSecureStorage.writeRefreshToken(maeumLoginEntity.refreshToken);

            emit(Loaded());
          } catch (err) {
            if(err.toString().contains("404")){
              emit(
                Error(
                  exception: Exception("User Not Found"),
                  data: MaeumAuthModel(oAuthToken: socialEntity.token, socialEnum: socialEnum),
                ),
              );
            } else {
              emit(Error(exception: err));
            }
          }

        } else {
          // maeum login fail !404
          emit(Error(exception: err));
        }
      }
    } catch (err) {
      // social login fail
      emit(Error(exception: err));
    }
  }

  void _maeumSocialLogoutHandler(
    MaeumSocialLogoutEvent event,
    Emitter<MaeumAuthState<MaeumAuthModel>> emit,
  ) async {
    emit(Loading());

    try {
      await _socialLogoutUseCase.execute(socialRequest: event.socialRequest);
      emit(Empty());
    } catch (err) {
      emit(Error(exception: err));
    }
  }
}