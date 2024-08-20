import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maeumgagym_flutter/presentation/purpose/view_model/purpose/purpose_event.dart';
import 'package:maeumgagym_flutter/presentation/purpose/view_model/purpose/purpose_state.dart';

import '../../../../domain/purposes/entity/purpose_entity.dart';
import '../../../../domain/purposes/use_case/get_purpose_detail_use_case.dart';

class PurposeBloc extends Bloc<PurposeEvent, PurposeState<PurposeEntity>> {
  final GetPurposeDetailUseCase _getPurposeDetailUseCase;

  PurposeBloc({
    required GetPurposeDetailUseCase getPurposeDetailUseCase,
  })  : _getPurposeDetailUseCase = getPurposeDetailUseCase,
        super(Empty()) {
    on<GetPurposeDetailEvent>(_getDetailRoutineHandler);
  }

  void _getDetailRoutineHandler(GetPurposeDetailEvent event, Emitter<PurposeState<PurposeEntity>> emit) async {
    emit(Loading());

    try {
      PurposeEntity purposeEntity = await _getPurposeDetailUseCase.execute(purposeId: event.purposeId);
      emit(Loaded(data: purposeEntity));
    } catch (err) {
      emit(Error(exception: err));
    }
  }
}
