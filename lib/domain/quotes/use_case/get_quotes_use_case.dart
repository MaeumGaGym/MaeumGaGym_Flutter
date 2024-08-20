import 'package:maeumgagym_flutter/domain/quotes/entity/quotes_entity.dart';
import 'package:maeumgagym_flutter/domain/quotes/repository/quotes_repository.dart';

class GetQuotesUseCase {
  final QuotesRepository _quotesRepository;

  GetQuotesUseCase({
    required QuotesRepository quotesRepository,
  }) : _quotesRepository = quotesRepository;

  Future<QuotesEntity> execute() => _quotesRepository.getQuotes();
}