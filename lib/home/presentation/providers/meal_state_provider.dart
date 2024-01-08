import 'package:flutter_riverpod/flutter_riverpod.dart';

enum MealState { breakfast, lunch, dinner }

final mealStateProvider =
    StateProvider<MealState>((ref) => MealState.breakfast);
