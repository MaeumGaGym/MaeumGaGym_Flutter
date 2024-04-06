import 'package:maeum_ga_gym_flutter/home/domain/model/home_quotes_model.dart';
import 'package:maeum_ga_gym_flutter/home/domain/repository/home_quotes_repository.dart';

class HomeQuotesUseCase {
  final HomeQuotesRepository _repository;

  const HomeQuotesUseCase(this._repository);

  Future<HomeQuotesModel> getQuotes() async {
    return _repository.getQuotes();
  }
}
