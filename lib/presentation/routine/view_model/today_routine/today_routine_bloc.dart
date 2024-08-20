import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maeumgagym_flutter/domain/routines/entity/routines_entity.dart';
import 'package:maeumgagym_flutter/presentation/routine/view_model/today_routine/today_routine_event.dart';
import 'package:maeumgagym_flutter/presentation/routine/view_model/today_routine/today_routine_state.dart';

import '../../../../domain/routines/use_case/get_today_routine_use_case.dart';

class TodayRoutineBloc extends Bloc<TodayRoutineEvent, TodayRoutineState<RoutinesEntity>> {
  final GetTodayRoutineUseCase _getTodayRoutineUseCase;

  TodayRoutineBloc({
    required GetTodayRoutineUseCase getTodayRoutineUseCase,
  })  : _getTodayRoutineUseCase = getTodayRoutineUseCase,
        super(Empty()){
    on<GetTodayRoutineEvent>(_getTodayRoutineHandler);
  }

  void _getTodayRoutineHandler(GetTodayRoutineEvent event, Emitter<TodayRoutineState<RoutinesEntity>> emit) async {
    emit(Loading());

    try{
      RoutinesEntity routinesEntity = await _getTodayRoutineUseCase.execute();
      emit(Loaded(data: routinesEntity));
    } catch (err) {
      emit(Error(exception: err));
    }
  }
}