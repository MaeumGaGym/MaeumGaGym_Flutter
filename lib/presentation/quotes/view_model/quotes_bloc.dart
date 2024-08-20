import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maeumgagym_flutter/domain/quotes/entity/quotes_entity.dart';
import 'package:maeumgagym_flutter/domain/quotes/use_case/get_quotes_use_case.dart';
import 'package:maeumgagym_flutter/presentation/quotes/view_model/quotes_event.dart';
import 'package:maeumgagym_flutter/presentation/quotes/view_model/quotes_state.dart';

class QuotesBloc extends Bloc<QuotesEvent, QuotesState<QuotesEntity>> {
  final GetQuotesUseCase _getQuotesUseCase;

  QuotesBloc({
    required GetQuotesUseCase getQuotesUseCase,
  })  : _getQuotesUseCase = getQuotesUseCase,
        super(Empty()){
    on<GetQuotesEvent>(_homeEventHandler);
  }

  void _homeEventHandler(GetQuotesEvent event, Emitter<QuotesState<QuotesEntity>> emit) async {
    emit(Loading());

    try {
      QuotesEntity quotesEntity = await _getQuotesUseCase.execute();

      emit(Loaded(data: quotesEntity));
    } catch (err) {
      emit(Error(exception: err));
    }
  }
}