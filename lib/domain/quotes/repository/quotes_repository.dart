import 'package:maeumgagym_flutter/domain/quotes/entity/quotes_entity.dart';

abstract class QuotesRepository {
  Future<QuotesEntity> getQuotes();
}