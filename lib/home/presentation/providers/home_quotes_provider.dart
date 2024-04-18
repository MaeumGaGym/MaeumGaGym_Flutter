import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maeum_ga_gym_flutter/home/data/repositoryImpl/home_quotes_repository_impl.dart';
import 'package:maeum_ga_gym_flutter/home/domain/model/home_quotes_model.dart';
import 'package:maeum_ga_gym_flutter/home/domain/usecase/home_quotes_usecase.dart';

final homeQuotesController =
    StateNotifierProvider<HomeQuotesStateNotifier, HomeQuotesModel>((ref) {
  return HomeQuotesStateNotifier();
});

class HomeQuotesStateNotifier extends StateNotifier<HomeQuotesModel> {
  HomeQuotesStateNotifier()
      : super(HomeQuotesModel(
          statusCode: const AsyncData(500),
          message: null,
          author: null,
        ));

  final HomeQuotesUseCase _useCase = HomeQuotesUseCase(
    HomeQuotesRepositoryImpl(),
  );

  Future<void> getQuotes() async {
    state = state.copyWith(statusCode: const AsyncLoading());
    state = state = await _useCase.getQuotes();
  }
}
