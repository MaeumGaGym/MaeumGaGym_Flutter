import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maeumgagym_flutter/core/token_secure_storage.dart';
import 'package:maeumgagym_flutter/domain/auth/use_case/maeum/maeum_withdrawal_use_case.dart';
import 'package:maeumgagym_flutter/domain/profile/entity/profile_entity.dart';
import 'package:maeumgagym_flutter/presentation/profile/view_model/profile_event.dart';
import 'package:maeumgagym_flutter/presentation/profile/view_model/profile_state.dart';

import '../../../domain/profile/use_case/get_profile_use_case.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState<ProfileEntity>> {
  final MaeumWithdrawalUseCase _maeumWithdrawalUseCase;
  final GetProfileUseCase _getProfileUseCase;

  ProfileBloc({
    required GetProfileUseCase getProfileUseCase,
    required MaeumWithdrawalUseCase maeumWithdrawalUseCase,
  })  : _getProfileUseCase = getProfileUseCase,
        _maeumWithdrawalUseCase = maeumWithdrawalUseCase,
        super(Empty()) {
    on<GetProfileEvent>(_getProfileHandler);
    on<WithdrawalEvent>(_withdrawalHandler);
    on<LogoutEvent>(_logoutHandler);
  }

  void _getProfileHandler(GetProfileEvent getProfileEvent, Emitter<ProfileState<ProfileEntity>> emit) async {
    emit(Loading());

    try {
      ProfileEntity profileEntity = await _getProfileUseCase.execute();
      emit(Loaded(data: profileEntity));
    } catch (err) {
      emit(Error(exception: err));
    }
  }

  void _withdrawalHandler(WithdrawalEvent getProfileEvent, Emitter<ProfileState<ProfileEntity>> emit) async {
    emit(Loading());

    try {
      await _maeumWithdrawalUseCase.execute();

      TokenSecureStorage.writeAccessToken(null);
      TokenSecureStorage.writeRefreshToken(null);

      emit(Empty());
    } catch (err) {
      emit(Error(exception: err));
    }
  }

  void _logoutHandler(LogoutEvent getProfileEvent, Emitter<ProfileState<ProfileEntity>> emit) async {
    TokenSecureStorage.writeAccessToken(null);
    TokenSecureStorage.writeRefreshToken(null);
  }
}
