import 'package:maeum_ga_gym_flutter/home/domain/model/home_quotes_model.dart';

abstract class HomeQuotesRepository {
  Future<HomeQuotesModel> getQuotes();
}
