import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maeumgagym_flutter/domain/routines/entity/routines_entity.dart';
import 'package:maeumgagym_flutter/domain/routines/use_case/add_routine_use_case.dart';
import 'package:maeumgagym_flutter/presentation/routine/view_model/routines/routines_event.dart';
import 'package:maeumgagym_flutter/presentation/routine/view_model/routines/routines_state.dart';

import '../../../../domain/routines/use_case/del_routine_use_case.dart';
import '../../../../domain/routines/use_case/edit_routine_use_case.dart';
import '../../../../domain/routines/use_case/get_routines_use_case.dart';

class RoutinesBloc extends Bloc<RoutinesEvent, RoutinesState<RoutinesEntity>> {
  final GetRoutinesUseCase _getRoutinesUseCase;
  final AddRoutineUseCase _addRoutineUseCase;
  final EditRoutineUseCase _editRoutineUseCase;
  final DelRoutineUseCase _delRoutineUseCase;

  RoutinesBloc({
    required GetRoutinesUseCase getRoutinesUseCase,
    required AddRoutineUseCase addRoutineUseCase,
    required EditRoutineUseCase editRoutineUseCase,
    required DelRoutineUseCase delRoutineUseCase,
  })  : _getRoutinesUseCase = getRoutinesUseCase,
        _addRoutineUseCase = addRoutineUseCase,
        _editRoutineUseCase = editRoutineUseCase,
        _delRoutineUseCase = delRoutineUseCase,
        super(Empty()) {
    on<GetRoutinesInitEvent>(_getRoutinesInitHandler);
    on<GetRoutinesEvent>(_getRoutinesHandler);
    on<AddRoutineEvent>(_addRoutineHandler);
    on<EditRoutineEvent>(_editRoutineHandler);
    on<DelRoutineEvent>(_delRoutineHandler);
  }

  void _getRoutinesInitHandler(GetRoutinesInitEvent event, Emitter<RoutinesState<RoutinesEntity>> emit) async {
    emit(Loading());

    try {
      RoutinesEntity routinesEntity = await _getRoutinesUseCase.execute(index: 0);
      emit(Loaded(data: routinesEntity));
    } catch (err) {
      emit(Error(exception: err));
    }
  }

  void _getRoutinesHandler(GetRoutinesEvent event, Emitter<RoutinesState<RoutinesEntity>> emit) async {
    try {
      RoutinesEntity routinesEntity = await _getRoutinesUseCase.execute(index: event.index);
      RoutinesEntity response = RoutinesEntity(routines: state.value.routines + routinesEntity.routines);

      emit(Loaded(data: response));
    } catch (err) {
      emit(Error(exception: err));
    }
  }

  void _addRoutineHandler(AddRoutineEvent event, Emitter<RoutinesState<RoutinesEntity>> emit) async {
    emit(Loading());

    try {
      await _addRoutineUseCase.execute(addRoutineRequest: event.addRoutineRequest);
      RoutinesEntity routinesEntity = await _getRoutinesUseCase.execute(index: 0);
      emit(Loaded(data: routinesEntity));
    } catch (err) {
      emit(Error(exception: err));
    }
  }

  void _editRoutineHandler(EditRoutineEvent event, Emitter<RoutinesState<RoutinesEntity>> emit) async {
    emit(Loading());

    try {
      await _editRoutineUseCase.execute(
        routineId: event.routineId,
        addRoutineRequest: event.addRoutineRequest,
      );

      RoutinesEntity routinesEntity = await _getRoutinesUseCase.execute(index: 0);
      emit(Loaded(data: routinesEntity));
    } catch (err) {
      emit(Error(exception: err));
    }
  }

  void _delRoutineHandler(DelRoutineEvent event, Emitter<RoutinesState<RoutinesEntity>> emit) async {
    emit(Loading());

    try {
      await _delRoutineUseCase.execute(routineId: event.routineId);

      RoutinesEntity routinesEntity = await _getRoutinesUseCase.execute(index: 0);
      emit(Loaded(data: routinesEntity));
    } catch (err) {
      emit(Error(exception: err));
    }
  }
}
