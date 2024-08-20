import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maeumgagym_flutter/domain/routines/entity/routine_entity.dart';
import 'package:maeumgagym_flutter/domain/routines/use_case/edit_routine_use_case.dart';
import 'package:maeumgagym_flutter/presentation/routine/view_model/routine/routine_event.dart';
import 'package:maeumgagym_flutter/presentation/routine/view_model/routine/routine_state.dart';

import '../../../../domain/routines/use_case/get_routine_detail_use_case.dart';

class RoutineBloc extends Bloc<RoutineEvent, RoutineState<RoutineEntity>> {
  final EditRoutineUseCase _editRoutineUseCase;
  final GetRoutineDetailUseCase _getRoutineDetailUseCase;

  RoutineBloc({
    required EditRoutineUseCase editRoutineUseCase,
    required GetRoutineDetailUseCase getRoutineDetailUseCase,
  })  : _editRoutineUseCase = editRoutineUseCase,
        _getRoutineDetailUseCase = getRoutineDetailUseCase,
        super(Empty()) {
    on<GetRoutineDetailEvent>(_getDetailRoutineHandler);
  }

  void _getDetailRoutineHandler(GetRoutineDetailEvent event, Emitter<RoutineState<RoutineEntity>> emit) async {
    emit(Loading());

    if(event.addRoutineRequest == null){
      try{
        RoutineEntity routineEntity = await _getRoutineDetailUseCase.execute(routineId: event.routineId);
        emit(Loaded(data: routineEntity));
      } catch(err){
        emit(Error(exception: err));
      }
    } else {
      try {
        await _editRoutineUseCase.execute(
          routineId: event.routineId,
          addRoutineRequest: event.addRoutineRequest!,
        );

        RoutineEntity routineEntity = await _getRoutineDetailUseCase.execute(routineId: event.routineId);

        emit(Loaded(data: routineEntity));
      } catch (err) {
        emit(Error(exception: err));
      }
    }
  }
}