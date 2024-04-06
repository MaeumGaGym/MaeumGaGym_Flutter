import 'package:maeum_ga_gym_flutter/home/data/data_source/remote/home_quotes_remote_data_source.dart';
import 'package:maeum_ga_gym_flutter/home/domain/model/home_quotes_model.dart';
import 'package:maeum_ga_gym_flutter/home/domain/repository/home_quotes_repository.dart';

class HomeQuotesRepositoryImpl implements HomeQuotesRepository {
  final HomeQuotesRemoteDataSource _dataSource = HomeQuotesRemoteDataSource();

  @override
  Future<HomeQuotesModel> getQuotes() async {
    return await _dataSource.getQuotes();
  }
}
