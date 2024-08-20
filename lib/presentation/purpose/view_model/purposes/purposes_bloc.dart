import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maeumgagym_flutter/domain/purposes/entity/purposes_entity.dart';
import 'package:maeumgagym_flutter/domain/purposes/use_case/add_purpose_use_case.dart';
import 'package:maeumgagym_flutter/presentation/purpose/view_model/purposes/purposes_event.dart';
import 'package:maeumgagym_flutter/presentation/purpose/view_model/purposes/purposes_state.dart';

import '../../../../domain/purposes/use_case/del_purpose_use_case.dart';
import '../../../../domain/purposes/use_case/edit_purpose_use_case.dart';
import '../../../../domain/purposes/use_case/get_purposes_use_case.dart';

class PurposesBloc extends Bloc<PurposesEvent, PurposesState<PurposesEntity>> {
  final GetPurposesUseCase _getPurposesUseCase;
  final AddPurposeUseCase _addPurposeUseCase;
  final EditPurposeUseCase _editPurposeUseCase;
  final DelPurposeUseCase _delPurposeUseCase;

  PurposesBloc({
    required GetPurposesUseCase getPurposesUseCase,
    required AddPurposeUseCase addPurposeUseCase,
    required EditPurposeUseCase editPurposeUseCase,
    required DelPurposeUseCase delPurposeUseCase,
  })  : _addPurposeUseCase = addPurposeUseCase,
        _getPurposesUseCase = getPurposesUseCase,
        _editPurposeUseCase = editPurposeUseCase,
        _delPurposeUseCase = delPurposeUseCase,
        super(Empty()) {
    on<GetPurposesInitEvent>(_getPurposeHandler);
    on<AddPurposeEvent>(_addPurposeHandler);
    on<EditPurposeEvent>(_editPurposeHandler);
    on<DelPurposeEvent>(_delPurposeHandler);
  }

  void _getPurposeHandler(GetPurposesInitEvent event, Emitter<PurposesState<PurposesEntity>> emit) async {
    emit(Loading());

    try {
      PurposesEntity purposesEntity = await _getPurposesUseCase.execute(index: 0);
      emit(Loaded(data: purposesEntity));
    } catch (err) {
      emit(Error(exception: err));
    }
  }

  void _addPurposeHandler(AddPurposeEvent event, Emitter<PurposesState<PurposesEntity>> emit) async {
    emit(Loading());

    try {
      await _addPurposeUseCase.execute(addEditPurposeRequest: event.addEditPurposeRequest);
      PurposesEntity purposesEntity = await _getPurposesUseCase.execute(index: 0);
      emit(Loaded(data: purposesEntity));
    } catch (err) {
      emit(Error(exception: err));
    }
  }

  void _editPurposeHandler(EditPurposeEvent event, Emitter<PurposesState<PurposesEntity>> emit) async {
    emit(Loading());

    try {
      await _editPurposeUseCase.execute(
        purposeId: event.purposeId,
        addEditPurposeRequest: event.addEditPurposeRequest,
      );
      PurposesEntity purposesEntity = await _getPurposesUseCase.execute(index: 0);
      emit(Loaded(data: purposesEntity));
    } catch (err) {
      emit(Error(exception: err));
    }
  }

  void _delPurposeHandler(DelPurposeEvent event, Emitter<PurposesState<PurposesEntity>> emit) async {
    emit(Loading());

    try {
      await _delPurposeUseCase.execute(purposeId: event.purposeId);
      PurposesEntity purposesEntity = await _getPurposesUseCase.execute(index: 0);
      emit(Loaded(data: purposesEntity));
    } catch (err) {
      emit(Error(exception: err));
    }
  }
}
