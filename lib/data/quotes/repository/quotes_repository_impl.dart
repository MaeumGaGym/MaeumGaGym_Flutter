import 'package:maeumgagym_flutter/data/quotes/data_source/remote/remote_quotes_data_source.dart';
import 'package:maeumgagym_flutter/domain/quotes/entity/quotes_entity.dart';
import 'package:maeumgagym_flutter/domain/quotes/repository/quotes_repository.dart';

class QuotesRepositoryImpl implements QuotesRepository {
  final RemoteQuotesDataSource _remoteQuotesDataSource;

  QuotesRepositoryImpl({
    required RemoteQuotesDataSource remoteQuotesDataSource,
  }) : _remoteQuotesDataSource = remoteQuotesDataSource;

  @override
  Future<QuotesEntity> getQuotes() async {
    return await _remoteQuotesDataSource.getQuotes();
  }
}