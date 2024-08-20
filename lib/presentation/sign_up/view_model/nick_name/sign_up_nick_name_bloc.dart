import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maeumgagym_flutter/domain/auth/use_case/maeum/maeum_check_nick_name.dart';
import 'package:maeumgagym_flutter/presentation/sign_up/view_model/nick_name/sign_up_nick_name_event.dart';
import 'package:maeumgagym_flutter/presentation/sign_up/view_model/nick_name/sign_up_nick_name_state.dart';

class SignUpNickNameBloc extends Bloc<SignUpNickNameEvent, SignUpNickNameState<bool>> {
  final MaeumCheckNickNameUseCase _maeumCheckNickNameUseCase;

  SignUpNickNameBloc({
    required MaeumCheckNickNameUseCase maeumCheckNickNameUseCase,
  })  : _maeumCheckNickNameUseCase = maeumCheckNickNameUseCase,
        super(Empty()){
    on<SignUpCheckNickNameEvent>(_checkNickNameHandler, transformer: droppable());
  }

  void _checkNickNameHandler(SignUpCheckNickNameEvent event, Emitter<SignUpNickNameState<bool>> emit) async {
    emit(Loading());
    try{
      if(event.nickName.length < 2 || event.nickName.length > 10 || event.nickName.isEmpty || event.nickName.contains(" ")){
        throw Exception("Validation Error");
      }

      bool data = await _maeumCheckNickNameUseCase.execute(nickName: event.nickName);
      emit(Loaded(data: data));
    } catch (err) {
      emit(Error(exception: err));
    }
  }
}