import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maeumgagym_flutter/core/token_secure_storage.dart';
import 'package:maeumgagym_flutter/domain/auth/entity/maeum_token_entity.dart';
import 'package:maeumgagym_flutter/domain/auth/use_case/maeum/maeum_login_use_case.dart';
import 'package:maeumgagym_flutter/presentation/sign_up/view_model/success/sign_up_success_event.dart';
import 'package:maeumgagym_flutter/presentation/sign_up/view_model/success/sign_up_success_state.dart';

import '../../../../domain/auth/use_case/maeum/maeum_sign_up_use_case.dart';

class SignUpSuccessBloc extends Bloc<SignUpSuccessEvent, SignUpSuccessState> {
  final MaeumSignUpUseCase _maeumSignUpUseCase;
  final MaeumLoginUseCase _maeumLoginUseCase;

  SignUpSuccessBloc({
    required MaeumSignUpUseCase maeumSignUpUseCase,
    required MaeumLoginUseCase maeumLoginUseCase,
  })  : _maeumSignUpUseCase = maeumSignUpUseCase,
        _maeumLoginUseCase = maeumLoginUseCase,
        super(Empty()) {
    on<SignUpSuccessEvent>(_maeumSignUpHandler, transformer: droppable());
  }

  void _maeumSignUpHandler(SignUpSuccessEvent event, Emitter<SignUpSuccessState> emit) async {
    emit(Loading());

    try {
      await _maeumSignUpUseCase.execute(maeumSignUpRequest: event.maeumSignUpRequest);
      MaeumTokenEntity maeumTokenEntity = await _maeumLoginUseCase.execute(
        socialRequest: event.maeumSignUpRequest.socialEnum,
        oAuthToken: event.maeumSignUpRequest.oAuthToken,
      );

      TokenSecureStorage.writeAccessToken(maeumTokenEntity.accessToken);
      TokenSecureStorage.writeRefreshToken(maeumTokenEntity.refreshToken);

      emit(Loaded());
    } catch(err) {
      emit(Error(exception: err));
    }
  }
}